//
//  IdentityImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 27/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class IdentityImplementingTests: XCTestCase {

    func test_identify_logged_userId_Persisted() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_identify_logged_userId_Persisted") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        sut.identify(userId: "123", traits: [.firstName: "John",
                                             .lastName: "Smith",
                                             .dynamic(rawValue: "otherKey"): "AAA"]) { result in
            switch result {
            case .success:
                guard let loggedEvent = spy.eventsLogged.first,
                      let body = loggedEvent.new else { return XCTFail("Failure") }
                XCTAssertEqual(loggedEvent.type, "user")
                XCTAssertEqual(loggedEvent.action, "identify")
                XCTAssertTrue(body.contains("\"firstName\":\"John\""))
                XCTAssertTrue(body.contains("\"lastName\":\"Smith\""))
                XCTAssertTrue(body.contains("\"otherKey\":\"AAA\""))
                XCTAssertTrue(identityPersister.retrieveUserId() == "123")
            case .failure: XCTFail("Failure")
            }
        }
    }

    func test_alias_logged() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_alias_logged") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        sut.alias(aliasType: .dynamic(rawValue: "ABC"), aliasId: "123") { result in
            switch result {
            case .success:
                guard let loggedEvent = spy.eventsLogged.first,
                      let body = loggedEvent.new else { return XCTFail("Failure") }
                XCTAssertEqual(loggedEvent.type, "user")
                XCTAssertEqual(loggedEvent.action, "alias")
                XCTAssertTrue(body.contains("\"ABC\":\"123\""))
            case .failure: XCTFail("Failure")
            }
        }
    }

    func test_clear() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_clear") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister:
                                                identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        XCTAssertNil(identityPersister.retrieveUserId())
        sut.identify(userId: "aaa", traits: [:], completion: nil)
        XCTAssertEqual(identityPersister.retrieveUserId(), "aaa")
        sut.clear()
        XCTAssertNil(identityPersister.retrieveUserId())
    }
}
