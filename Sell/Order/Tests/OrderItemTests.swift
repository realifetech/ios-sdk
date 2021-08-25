//
//  OrderItemTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class OrderItemTests: XCTestCase {

    func test_publicIntialiser() {
        let sut = OrderItem(
            id: "1",
            product: nil,
            productVariant: nil,
            fulfilmentPoint: nil,
            productModifierItems: nil,
            price: nil,
            modifierItemsPrice: nil,
            quantity: nil,
            totalPrice: nil,
            title: nil,
            subtitle: nil,
            imageUrl: nil)
        XCTAssertEqual(sut.id, "1")
    }

    func test_initWithApolloResponse_nonNilResponse_returnsValidValue() throws {
        let response = OrderModelTestsHelper.makeOrderItem(with: "1")
        let sut = try XCTUnwrap(OrderItem(response: response))
        XCTAssertEqual(sut.id, response.id)
        XCTAssertEqual(sut.price, response.price)
        XCTAssertEqual(sut.modifierItemsPrice, response.modifierItemsPrice)
        XCTAssertEqual(sut.quantity, response.quantity)
        XCTAssertEqual(sut.totalPrice, response.totalPrice)
        XCTAssertEqual(sut.title, response.title)
        XCTAssertEqual(sut.subtitle, response.subtitle)
        XCTAssertEqual(sut.imageUrl, response.imageUrl)
    }

    func test_initWithApolloResponse_nilResponse_returnsNil() {
        XCTAssertNil(OrderItem(response: nil))
    }
}
