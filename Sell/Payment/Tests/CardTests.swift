//
//  CardTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class CardTests: XCTestCase {

    func  test_publicInitialiser() {
        let sut = Card(
            brand: "A",
            numberToken: "B",
            expMonth: "C",
            expYear: "D",
            last4: "E",
            fingerprint: "F")
        XCTAssertEqual(sut.brand, "A")
        XCTAssertEqual(sut.numberToken, "B")
        XCTAssertEqual(sut.expMonth, "C")
        XCTAssertEqual(sut.expYear, "D")
        XCTAssertEqual(sut.last4, "E")
        XCTAssertEqual(sut.fingerprint, "F")
    }

    func test_initWithFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = ApolloType.FragmentCard(
            brand: "A",
            numberToken: "B",
            expMonth: "C",
            expYear: "D",
            last4: "E",
            fingerprint: "F")
        let sut = try XCTUnwrap(Card(response: fragment))
        XCTAssertEqual(sut.brand, fragment.brand)
        XCTAssertEqual(sut.numberToken, fragment.numberToken)
        XCTAssertEqual(sut.expMonth, fragment.expMonth)
        XCTAssertEqual(sut.expYear, fragment.expYear)
        XCTAssertEqual(sut.last4, fragment.last4)
        XCTAssertEqual(sut.fingerprint, fragment.fingerprint)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(Card(response: nil))
    }
}
