//
//  BasketErrorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class BasketErrorTests: XCTestCase {

    private let message = "A"
    private lazy var cases: [(BasketError.`Type`, String)] = [
        (.outOfStock, message),
        (.priceChange, message),
        (.mixedBasket, message),
        (.emptyBasket, message),
        (.regularError(MockError.fail), MockError.fail.errorDescription ?? "")
    ]

    func test_errorDescription() {
        let sut = cases.map { BasketError(type: $0.0, message: $0.1) }
        sut.forEach {
            XCTAssertEqual($0.errorDescription, $0.message)
        }
    }

    func test_combinedErrorMessage_emptyErrors_returnEmptyMessage() {
        let sut: [BasketError] = []
        XCTAssertTrue(sut.combinedErrorMessage.isEmpty)
    }

    func test_combinedErrorMessage_oneError_returnFirstErrorMessage() {
        let sut: [BasketError] = [BasketError(type: .outOfStock, message: "A")]
        XCTAssertEqual(sut.combinedErrorMessage, sut.first?.message)
    }

    func test_combinedErrorMessage_multipleErrors_returnJoinedErrorMessages() {
        let sut = cases.map { BasketError(type: $0.0, message: $0.1) }
        let expectedMessage = Set(cases.compactMap { $0.1 })
            .sorted()
            .joined(separator: "\n")
        XCTAssertEqual(sut.combinedErrorMessage, expectedMessage)
    }
}

private enum MockError: Error, LocalizedError {
    case fail

    public var errorDescription: String? {
        "Fail"
    }
}
