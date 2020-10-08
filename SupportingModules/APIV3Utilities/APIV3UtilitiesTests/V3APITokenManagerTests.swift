//
//  V3APITokenManagerTests.swift
//  APIV3UtilitiesTests
//
//  Created by Olivier Butler on 08/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
@testable import APIV3Utilities

class V3APITokenManagerTests: XCTestCase {

    private var testStore: MockStore!
    private var testRefreshGenerator: MockRefreshGenerator!
    var sut: V3APITokenManager!

    override func setUp() {
        testStore = MockStore()
        testRefreshGenerator = MockRefreshGenerator()
        sut = V3APITokenManager(authorisationStore: testStore, oAuthRefreshOrWaitActionGenerator: testRefreshGenerator)
    }

    func test_token() {
        let tokenValue = "TOKEN_654"
        testStore.accessToken = tokenValue
        XCTAssertEqual(sut.token, tokenValue)
    }

    func test_tokenIsValid() {
        testStore.accessTokenValid = true
        XCTAssertTrue(sut.tokenIsValid)
        testStore.accessTokenValid = false
        XCTAssertFalse(sut.tokenIsValid)
    }

    func test_getTokenObservable() {
        testRefreshGenerator.refreshTokenOrWaitAction = nil
        XCTAssertNil(sut.getTokenObservable)
        testRefreshGenerator.refreshTokenOrWaitAction = Observable.just(())
        XCTAssertNotNil(sut.getTokenObservable)
    }

    func test_getValidToken_noDelay() {
        testRefreshGenerator.refreshTokenOrWaitAction = nil
        var synchronousCompletionCheck = false
        sut.getValidToken { synchronousCompletionCheck = true }
        XCTAssertTrue(synchronousCompletionCheck)
    }

    func test_getValidToken_delayedByObservable() {
        let observableSource = PublishSubject<Void>()
        testRefreshGenerator.refreshTokenOrWaitAction = observableSource.asObservable()
        let expectation = XCTestExpectation(description: "Valid token completion called")
        sut.getValidToken {
            expectation.fulfill()
        }
        observableSource.onNext(())
        wait(for: [expectation], timeout: 0.2)
    }
    
}

private final class MockStore: AuthorisationStoring {

    var accessToken: String?
    var accessTokenValid: Bool = false
    var credentialsToSave: (String, Int)?
    var removeCredentialsCalled: Bool = false

    func saveCredentials(token: String, secondsExpiresIn: Int) {
        credentialsToSave = (token, secondsExpiresIn)
    }

    func removeCredentials() {
        removeCredentialsCalled = true
    }
}

private final class MockRefreshGenerator: OAuthRefreshOrWaitActionGenerating {
    var refreshTokenOrWaitAction: Observable<Void>?
}
