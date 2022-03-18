//
//  ProductModifierItemSelectionTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class ProductModifierItemSelectionTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = ProductModifierItemSelection(
            productModifierItem: ProductModifierItem(
                id: "1",
                status: .active,
                additionalPrice: 10,
                translations: [StandardTitleTranslation(language: "en", title: "A")]),
            quantity: 1,
            totalPrice: 10)
        XCTAssertEqual(sut.productModifierItem?.id, "1")
        XCTAssertEqual(sut.productModifierItem?.additionalPrice, 10)
        XCTAssertEqual(sut.quantity, 1)
        XCTAssertEqual(sut.totalPrice, 10)
    }

    func test_initWithFragment() {
        let fragment = ApolloType.FragmentProductModifierItemSelection(
            productModifierItem: nil,
            quantity: 1,
            totalPrice: 100)
        let sut = ProductModifierItemSelection(response: fragment)
        XCTAssertEqual(sut.quantity, fragment.quantity)
        XCTAssertEqual(sut.totalPrice, fragment.totalPrice)
    }
}
