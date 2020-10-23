//
//  AnalyticsEventAndCompletionTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class AnalyticsEventAndCompletionTests: XCTestCase {

    let event = AnalyticsEvent(type: "Chumps", action: "Eat", version: "Eggs")

    func test_hasUUID() {
        let sut = AnalyticsEventAndCompletion(analyticsEvent: event, analyticsCompletion: nil)
        XCTAssertNotNil(sut.uniqueId)
    }

    func test_equatable() {
        let sut1 = AnalyticsEventAndCompletion(analyticsEvent: event, analyticsCompletion: nil)
        let sut2 = AnalyticsEventAndCompletion(analyticsEvent: event, analyticsCompletion: nil)
        XCTAssertEqual(sut1, sut1)
        XCTAssertNotEqual(sut1, sut2)
    }

    func test_decoding() {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let sut = AnalyticsEventAndCompletion(analyticsEvent: event, analyticsCompletion: nil)
        do {
            let data = try encoder.encode(sut)
            let decodedSut = try decoder.decode(AnalyticsEventAndCompletion.self, from: data)
            XCTAssertEqual(sut, decodedSut)
        } catch {
            XCTFail("Could not encode & decode sut. Error: \(error.localizedDescription)")
        }

    }

}
