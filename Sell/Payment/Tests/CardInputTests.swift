//
//  CardInputTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class CardInputTests: XCTestCase {

    func test_apolloCardInput() {
        let input = CardInput(
            brand: "A",
            numberToken: "B",
            expMonth: "C",
            expYear: "D",
            securityCodeToken: "E",
            last4: "F")
        let sut = input.apolloCardInput
        XCTAssertEqual(sut.brand, input.brand)
        XCTAssertEqual(sut.numberToken, input.numberToken)
        XCTAssertEqual(sut.expMonth, input.expMonth)
        XCTAssertEqual(sut.expYear, input.expYear)
        XCTAssertEqual(sut.securityCodeToken, input.securityCodeToken)
        XCTAssertEqual(sut.last4, input.last4)
    }
}
