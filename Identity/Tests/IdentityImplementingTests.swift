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

    func test_identify_logged() {
        let spy = MockAnalyticsLogger()
        let sut = IdentityFactory.makeModule(analyticsLogger: spy)
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
            case .failure: XCTFail("Failure")
            }
        }
    }

    func test_alias_logged() {
        let spy = MockAnalyticsLogger()
        let sut = IdentityFactory.makeModule(analyticsLogger: spy)
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
}
