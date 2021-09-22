//
//  IdentityImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 14/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class IdentityImplementingTests: XCTestCase {

    private var sut: IdentityImplementing!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let sell = IdentityFactory.makeIdentityModule(orderingJourneyViewUpdater: MockOrderingJourneyViewUpdater())
        sut = try XCTUnwrap(sell as? IdentityImplementing)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_isHostAppLoginDeepLink_true() {
        XCTAssertTrue(sut.isHostAppLoginDeepLink(url: URL(string: "deeplinkscheme://rlthostapplogin")))
    }

    func test_isHostAppLoginDeepLink_false() {
        XCTAssertFalse(sut.isHostAppLoginDeepLink(url: URL(string: "deeplinkscheme://someotherdeeplink")))
    }

    func test_isHostAppLoginDeepLink_nil() {
        XCTAssertFalse(sut.isHostAppLoginDeepLink(url: nil))
    }

    func test_isHostAppLoginDeepLink_unparseable() {
        XCTAssertFalse(sut.isHostAppLoginDeepLink(url: URL(string: "...")))
    }

    func test_attemptLogin_authenticatorCalled() {
        let authenticator = MockAuthenticator()
        let sut = IdentityImplementing(hostAppAuthenticator: authenticator)
        sut.attemptLogin(emailAddress: "a", firstName: "b", lastName: "c", salt: "d") { error in
            XCTAssertEqual(authenticator.userInfo?.emailAddress, "a")
            XCTAssertEqual(authenticator.userInfo?.firstName, "b")
            XCTAssertEqual(authenticator.userInfo?.lastName, "c")
            XCTAssertEqual(authenticator.salt, "d")
            XCTAssertEqual(error as? DummyError, .failure)
        }
    }
}

private final class MockAuthenticator: HostAppAuthenticating {
    var userInfo: HostAppUserInfo?
    var salt: String?
    func attemptLogin(userInfo: HostAppUserInfo, salt: String, completion: @escaping HostAppLoginCompletion) {
        self.userInfo = userInfo
        self.salt = salt
        completion(DummyError.failure)
    }
}

private final class MockOrderingJourneyViewUpdater: OrderingJourneyViewUpdating {
    var orderingJourneyView: OrderingJourneyViewUpdatable?
    func evaluate(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?) { }
    func reload() { }
    func ensureUpdated() { }
}
