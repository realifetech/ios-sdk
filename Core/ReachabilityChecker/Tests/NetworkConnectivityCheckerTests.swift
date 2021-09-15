//
//  NetworkConnectivityCheckerTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class NetworkConnectivityCheckerTests: XCTestCase {

    private var sut: NetworkConnectivityChecker!
    private var timeLogger: MockTimeLogger!

    override func setUp() {
        super.setUp()
        timeLogger = MockTimeLogger()
        sut = NetworkConnectivityChecker(requestTimeLogger: timeLogger)
    }

    override func tearDown() {
        sut = nil
        timeLogger = nil
        super.tearDown()
    }

    // NOTE: test_wifiConnected and test_hasNetworkConnection will fail without network connection
    // We are unable to mock and swizzle SCNetworkReachabilityGetFlags as it's globla function in SystemConfiguration
    func test_wifiConnected() {
        XCTAssertTrue(sut.wifiConnected)
    }

    func test_hasNetworkConnection() {
        XCTAssertTrue(sut.hasNetworkConnection)
    }

    func test_isPoorNetworkConnection_timeLoggerContainsSlowRequests_returnTrue() {
        timeLogger.shouldContainSlowRequests = true
        XCTAssertTrue(sut.isPoorNetworkConnection)
    }

    func test_isPoorNetworkConnection_timeLoggerDoesnotContainSlowRequests_returnFalse() {
        timeLogger.shouldContainSlowRequests = false
        XCTAssertFalse(sut.isPoorNetworkConnection)
    }
}

private final class MockTimeLogger: RequestTimeLogger {

    var shouldContainSlowRequests = false

    override func containsSlowRequestsAndRemove() -> Bool {
        shouldContainSlowRequests
    }
}
