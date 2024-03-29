//
//  APIRequesterTests.swift
//  APIUtilitiesTests
//
//  Created by Olivier Butler on 07/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
@testable import RealifeTech

final class APIRequesterTests: XCTestCase {

    let testRoot: String = "http://test.com"
    let testDeviceId: String = "ID123"
    private var testTokenManager: MockTokenManager = MockTokenManager()
    let expectedFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ"
    let expectedLocale: String = "en_US_POSIX"

    override func setUp() {
        super.setUp()
        APIRequesterHelper.deviceId = testDeviceId
        APIRequesterHelper.baseUrl = testRoot
        APIRequesterHelper.tokenManager = testTokenManager
    }

    override func tearDown() {
        testTokenManager = MockTokenManager()
        super.tearDown()
    }

    func test_root() {
        XCTAssertEqual(MockRequester.root(), testRoot)
    }

    func test_dateFormatString() {
        XCTAssertEqual(MockRequester.dateFormatString(), expectedFormat)
    }

    func test_dateFormat() throws {
        let (format, localeIdentifier) = try XCTUnwrap(MockRequester.dateFormat())
        XCTAssertEqual(localeIdentifier, expectedLocale)
        XCTAssertEqual(format, expectedFormat)
    }

    func test_format() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = expectedFormat
        formatter.locale = Locale(identifier: expectedLocale)
        let expectedResult = formatter.string(from: date)
        let result = MockRequester.format(date: date)
        XCTAssertEqual(result, expectedResult)
    }

    func test_interceptors() {
        guard let url = URL(string: "http://test.com") else {
            return XCTFail("Test setup failed")
        }
        var request = URLRequest(url: url)
        let testToken = "1234ZABC"
        testTokenManager.token = testToken
        testTokenManager.tokenIsValid = true

        guard let sutInterceptors = MockRequester.interceptors() else {
            return XCTFail("Did not get interceptors")
        }
        XCTAssertEqual(sutInterceptors.count, 4)
        sutInterceptors.forEach {
            request = $0(request)
        }
        guard let headerFields = request.allHTTPHeaderFields else {
            return XCTFail("No header fields added to request")
        }
        XCTAssertTrue(headerFields.contains(where: { tuple in
            let(key, value) = tuple
            return key == "Content-Type" && value == "application/json; charset=utf-8"
        }))
        XCTAssertTrue(headerFields.contains(where: { tuple in
            let(key, value) = tuple
            let expectedHeader = RequestHeader.generateDeviceIdHeader(deviceId: testDeviceId)
            return key == expectedHeader.header && value == expectedHeader.valueForHeader
        }))
        XCTAssertTrue(headerFields.contains(where: { tuple in
            let(key, value) = tuple
            let expectedHeader = RequestHeader.generateAuthHeader(accessToken: testToken)
            return key == expectedHeader.header && value == expectedHeader.valueForHeader
        }))
        XCTAssertTrue(headerFields.contains(where: { tuple in
            let(key, value) = tuple
            return key == "Accept-Language" && value.count == 2
        }))
    }

    func test_preDispatchAction_some() {
        let bag = DisposeBag()
        let source = PublishSubject<Void>()
        testTokenManager.getTokenObservable = source.asObservable()
        guard let resultObservable = MockRequester.preDispatchAction() else {
            return XCTFail("No pre-dispatch action returned")
        }
        let expectation = XCTestExpectation(description: "Pre-dispatch action did execute")
        resultObservable
            .subscribe({ _ in
                expectation.fulfill()
            })
            .disposed(by: bag)
        source.onNext(())
        wait(for: [expectation], timeout: 0.2)
    }
}

private struct MockRequester: APIRequester {}

private final class MockTokenManager: APITokenManagable {

    var token: String?
    var tokenIsValid: Bool = false
    var refreshToken: String?
    var refreshTokenIsValid: Bool = false
    var getTokenObservable: Observable<Void>?

    func getValidToken(_ completion: ((Result<Void, Error>) -> Void)?) {
        completion?(.success(()))
    }

    func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) { }

    func removeCredentials() { }
}
