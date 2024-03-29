//
//  AnalyticEventAndCompletionTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AnalyticEventAndCompletionTests: XCTestCase {

    let event = AnalyticEvent(
        type: "a",
        action: "b",
        new: ["d": "dd", "e": 55],
        old: ["f": Decimal(6.6)],
        version: "c")

    func test_hasUUID() {
        let sut = AnalyticEventAndCompletion(analyticEvent: event, analyticCompletion: nil)
        XCTAssertNotNil(sut.uniqueId)
    }

    func test_equatable() {
        let sut1 = AnalyticEventAndCompletion(analyticEvent: event, analyticCompletion: nil)
        let sut2 = AnalyticEventAndCompletion(analyticEvent: event, analyticCompletion: nil)
        XCTAssertEqual(sut1, sut1)
        XCTAssertNotEqual(sut1, sut2)
    }

    func test_decoding() {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let sut = AnalyticEventAndCompletion(analyticEvent: event, analyticCompletion: nil)
        do {
            let data = try encoder.encode(sut)
            let decodedSut = try decoder.decode(AnalyticEventAndCompletion.self, from: data)
            XCTAssertEqual(sut, decodedSut)
        } catch {
            XCTFail("Could not encode & decode sut. Error: \(error.localizedDescription)")
        }
    }

    func test_encoding_dictionaries() {
        XCTAssertTrue(event.new == "{\"e\":55,\"d\":\"dd\"}" || event.new == "{\"d\":\"dd\",\"e\":55}")
        XCTAssertEqual(event.old, "{\"f\":6.6}")
    }
}
