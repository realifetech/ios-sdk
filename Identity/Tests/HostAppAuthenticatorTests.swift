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

    func test_generateSignature() {
        let signature = sut.generateUserInfoSignature(userInfo: userInfo, salt: salt)
        let shaHash = "7614244E2ADE7000CCC7FBDE88839F48EEB86EE91B70E208BD3A92C7C93A3138"
        XCTAssert(signature == shaHash)
    }

    func test_attemptLogin_logicDataFlow() {
        let expectation = XCTestExpectation()
        let completion: HostAppLoginCompletion = { error in
            XCTAssertEqual(self.repository.userInfo?.firstName, self.userInfo.firstName)
            XCTAssertEqual(self.repository.salt, self.salt)
            XCTAssertEqual(self.repository.nonce, "nonce")
            XCTAssertEqual(self.viewUpdater.javacriptEvaluated, "acceptAuthDetails(\'a\', \'b\', 10, \'c\')")
            XCTAssertTrue(self.viewUpdater.reloaded)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        sut.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
        wait(for: [expectation], timeout: 0.5)
    }

    // TODO: Test failure case
    // TODO: Test viewUpdater

    // ------------- Util -------------
    var userInfo: HostAppUserInfo {
        return HostAppUserInfo(emailAddress: "user@test.com", firstName: "first", lastName: "last")
    }

    var salt: String {
        return "abc123"
    }
}

final class MockDataFlowRepository: HostAppLoginDataProviding {

    var userInfo: HostAppUserInfo?
    var salt: String?
    var nonce: String?
    var signature: String?
    var token: OAuthToken?

    func generateNonce(completion: GenerateNonceHandler) {
        completion(.success("nonce"))
    }

    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: AuthenticateUserHandler) {
        self.userInfo = userInfo
        self.salt = salt
        self.nonce = nonce
        self.signature = signature
        let oAuthToken = OAuthToken(accessToken: "a", refreshToken: "b", expiresIn: 10, tokenType: "c", scope: "d")
        completion(.success(oAuthToken))
    }
}

private final class MockOrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    var orderingJourneyView: OrderingJourneyView?
    var javacriptEvaluated = ""
    var reloaded = false

    func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        javacriptEvaluated = javascript
        completion?(nil, nil)
    }
    func reload() {
        reloaded = true
    }
}
