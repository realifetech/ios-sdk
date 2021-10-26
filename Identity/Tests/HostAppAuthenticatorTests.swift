//
//  HostAppAuthenticatorTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 17/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class HostAppAuthenticatorTests: XCTestCase {

    private var repository: MockDataFlowRepository!
    private var viewUpdater: MockOrderingJourneyViewUpdater!
    private var sut: HostAppAuthenticator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        repository = MockDataFlowRepository()
        viewUpdater = MockOrderingJourneyViewUpdater()
        sut = HostAppAuthenticator(hostAppLoginDataProvider: repository,
                                   orderingJourneyViewUpdater: viewUpdater)
    }

    override func tearDown() {
        repository = nil
        viewUpdater = nil
        sut = nil
        super.tearDown()
    }

    func test_attemptLogin_success() {
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertEqual(self.repository.userInfo?.firstName, self.userInfo.firstName)
            XCTAssertEqual(self.repository.salt, self.salt)
            XCTAssertEqual(self.repository.nonce, "nonce")
            XCTAssertEqual(self.repository.signature, self.signatureToCheck)
            XCTAssertEqual(self.viewUpdater.javacriptEvaluated, "acceptAuthDetails(\'a\', \'b\', 10, \'c\')")
            XCTAssertNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_attemptLogin_getDeviceIdFailure() {
        repository.failure = .getDeviceId
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_attemptLogin_generateNonceFailure() {
        repository.failure = .generateNonce
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_attemptLogin_authenticateUserFailure() {
        repository.failure = .authenticateUser
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_attemptLogin_authenticateWebViewFailure() {
        viewUpdater.shouldFail = true
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    // ------------- Util -------------
    var userInfo: HostAppUserInfo {
        return HostAppUserInfo(emailAddress: "user@test.com", firstName: "first", lastName: "last")
    }

    var salt: String {
        return "salt123"
    }

    var deviceId: String {
        return "deviceId123"
    }

    var signatureToCheck: String {
        return "a03f0362eb18a8c601cc9bcbf72c5d21e76e797b90e215db6f44f0548f4c034b"
    }
}

final class MockDataFlowRepository: HostAppLoginDataProviding {

    enum Failure {
        case none, getDeviceId, generateNonce, authenticateUser
    }

    var userInfo: HostAppUserInfo?
    var salt: String?
    var nonce: String?
    var signature: String?
    var token: OAuthToken?
    var failure: Failure = .none

    func getDeviceId(completion: GetDeviceIdHandler) {
        if failure == .getDeviceId {
            return completion(.failure(DummyError.failure))
        }
        completion(.success("deviceId123"))
    }

    func generateNonce(completion: GenerateNonceHandler) {
        if failure == .generateNonce {
            return completion(.failure(DummyError.failure))
        }
        completion(.success("nonce"))
    }

    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: AuthenticateUserHandler) {
        if failure == .authenticateUser {
            return completion(.failure(DummyError.failure))
        }
        self.userInfo = userInfo
        self.salt = salt
        self.nonce = nonce
        self.signature = signature
        let oAuthToken = OAuthToken(accessToken: "a", refreshToken: "b", expiresIn: 10, tokenType: "c", scope: "d")
        completion(.success(oAuthToken))
    }
}

private final class MockOrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    var javascriptRunDetails: JavascriptRunDetails?
    var orderingJourneyView: OrderingJourneyViewUpdatable?
    var javacriptEvaluated = ""
    var shouldFail = false

    func evaluate(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?) {
        if shouldFail {
            completion?(nil, DummyError.failure)
            return
        }
        javacriptEvaluated = javascript
        completion?(nil, nil)
    }

    func ensureUpdated() { }
}
