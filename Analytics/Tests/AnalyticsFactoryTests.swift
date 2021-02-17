//
//  AnalyticsFactoryTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RealifeTech_CoreSDK
@testable import RealifeTech

final class AnalyticsFactoryTests: XCTestCase {

    func test_makeModule() {
        let module = AnalyticsFactory.makeAnalyticsModule(
            dispatcher: MockAnalyticsLogger(),
            reachabilityHelper: MockReachabilityChecker(),
            deviceRegistering: MockDeviceRegistering())
        XCTAssertTrue(module is AnalyticsImplementing)
    }

    func test_makeModule_usesCorrectDependencies() {
        let expectation = XCTestExpectation(description: "Event received")
        let testEvent = AnalyticEvent(
            type: "one",
            action: "hundred",
            version: "dalmations",
            timestamp: Date())
        let logEventSpy = MockAnalyticsLogger()
        let mockReachabilityChecker = MockReachabilityChecker()
        mockReachabilityChecker.hasNetworkConnection = true
        let module = AnalyticsFactory.makeAnalyticsModule(
            dispatcher: logEventSpy,
            reachabilityHelper: mockReachabilityChecker,
            deviceRegistering: MockDeviceRegistering())
        module.logEvent(testEvent) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(logEventSpy.eventsLogged.first, testEvent)
    }

    private final class MockDeviceRegistering: DeviceRegistering {

        var shouldBeReady = true
        var sdkReady: Bool { shouldBeReady }
        let deviceId: String = ""

        func registerDevice(_: @escaping () -> Void) { }
    }
}
