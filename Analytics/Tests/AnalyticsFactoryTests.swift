//
//  AnalyticsFactoryTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AnalyticsFactoryTests: XCTestCase {

    func test_makeModule() {
        let module = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: MockGraphQLManager<PutAnalyticEventMutationDataType>(),
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
        let graphQLManager = MockGraphQLManager<PutAnalyticEventMutationDataType>()
        let mockReachabilityChecker = MockReachabilityChecker()
        mockReachabilityChecker.hasNetworkConnection = true
        graphQLManager.resultReturns = .success(AnalyticsLoggerTests().makeStubAnalyticsEventMutation())
        let module = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: graphQLManager,
            reachabilityHelper: mockReachabilityChecker,
            deviceRegistering: MockDeviceRegistering())
        module.logEvent(testEvent) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(graphQLManager.dispatchMutationIsCalled)
    }
}
