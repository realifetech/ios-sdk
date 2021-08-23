//
//  BasketItemTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class BasketItemTests: XCTestCase {

    func test_initWithApolloFragment_withResponse_validBasketItem() throws {
        let item =  ApolloType.FragmentBasket.Item(
            id: "1",
            price: 100,
            modifierItemsPrice: 0,
            quantity: 1,
            totalPrice: 100,
            fulfilmentPoint: nil,
            productVariant: nil,
            product: nil,
            productModifierItems: [
                ApolloType.FragmentBasket.Item.ProductModifierItem(unsafeResultMap: [:])
            ])
        let sut = try XCTUnwrap(BasketItem(response: item))
        XCTAssertEqual(sut.id, item.id)
        XCTAssertEqual(sut.price, item.price)
        XCTAssertEqual(sut.modifierItemsPrice, item.modifierItemsPrice)
        XCTAssertEqual(sut.quantity, item.quantity)
        XCTAssertEqual(sut.totalPrice, item.totalPrice)
        XCTAssertEqual(sut.productModifierItems?.count, item.productModifierItems?.count)
    }

    func test_initWithApolloFragment_withNilResponse_returnNil() {
        XCTAssertNil(BasketItem(response: nil))
    }
}
