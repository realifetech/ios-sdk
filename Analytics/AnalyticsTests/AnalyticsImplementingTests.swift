//
//  AnalyticsImplementingTests.swift
//  AnalyticsImplementingTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class AnalyticsImplementingTests: XCTestCase {

    func test_logEvent() {
        let spy = MockAnalyticsLogger()
        let sut = AnalyticsImplementing(analyticsLogger: spy)
        let testEvent = AnalyticsEvent(type: "One", action: "two", version: "three")
        sut.logEvent(testEvent) { result in
            switch result {
            case .success: break
            case .failure: XCTFail("Failure result from analytics implementing")
            }
        }
        XCTAssertEqual(testEvent, spy.eventsLogged.first)
    }
}
