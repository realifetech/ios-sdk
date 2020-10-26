//
//  AnalyticsFactoryTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class AnalyticsFactoryTests: XCTestCase {

    func test_makeModule() {
        let module = AnalyticsFactory.makeAnalyticsModule(
            dispatcher: MockAnalyticsLogger(),
            reachabilityHelper: MockReachabilityChecker(),
            deviceRegisteredValue: ReadOnlyCurrentValue(from: .init(true)))
        XCTAssertTrue(module is AnalyticsImplementing)
    }

    func test_makeModule_usesCorrectDependencies() {
        let expectation = XCTestExpectation(description: "Event received")
        let testEvent = AnalyticsEvent(type: "one", action: "hundred", version: "dalmations")
        let logEventSpy = MockAnalyticsLogger()
        let mockReachabilityChecker = MockReachabilityChecker()
        mockReachabilityChecker.hasNetworkConnection = true
        let module = AnalyticsFactory.makeAnalyticsModule(
            dispatcher: logEventSpy,
            reachabilityHelper: mockReachabilityChecker,
            deviceRegisteredValue: ReadOnlyCurrentValue(from: .init(true)))
        module.logEvent(testEvent) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(logEventSpy.eventsLogged.first, testEvent)
    }
}
