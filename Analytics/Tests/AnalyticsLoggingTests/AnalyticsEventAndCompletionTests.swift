//
//  AnalyticEventAndCompletionTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RealifeTech_CoreSDK
@testable import RealifeTech

class AnalyticEventAndCompletionTests: XCTestCase {

    let event = AnalyticEvent(
        type: "Chumps",
        action: "Eat",
        version: "Eggs")

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
}
