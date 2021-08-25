//
//  BasketTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class BasketTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = Basket(
            grossAmount: 10,
            discountAmount: 10,
            netAmount: 100,
            seatInfo: SeatInfo(
                row: "A",
                seat: "B",
                block: "C",
                table: "D"),
            timeslot: Timeslot(
                id: "1",
                startTime: Date().iso8601String,
                endTime: Date(timeIntervalSinceNow: 3600).iso8601String,
                translations: [
                    TimeslotTranslation(
                        language: "en",
                        title: "A",
                        description: "B",
                        collectionNote: "C")
                ]),
            collectionDate: Date(),
            collectionPreferenceType: .asap,
            items: [
                BasketItem(
                    id: "1",
                    price: 100,
                    modifierItemsPrice: 0,
                    quantity: 1,
                    totalPrice: 100,
                    fulfilmentPoint: nil,
                    productVariant: nil,
                    product: nil,
                    productModifierItems: nil)
            ])
        XCTAssertEqual(sut.netAmount, 100)
        XCTAssertEqual(sut.items?.first?.id, "1")
    }

    func test_initWithApolloFragment() {
        let basket = ApolloType.FragmentBasket(
            grossAmount: 10,
            discountAmount: 10,
            netAmount: 100,
            seatInfo: nil,
            timeslot: nil,
            collectionDate: Date().iso8601String,
            collectionPreferenceType: .asap,
            items: [
                ApolloType.FragmentBasket.Item(
                    id: "1",
                    price: 100,
                    modifierItemsPrice: 0,
                    quantity: 1,
                    totalPrice: 100,
                    fulfilmentPoint: nil,
                    productVariant: nil,
                    product: nil,
                    productModifierItems: nil)
            ])
        let sut = Basket(response: basket)
        XCTAssertEqual(sut.grossAmount, basket.grossAmount)
        XCTAssertEqual(sut.discountAmount, basket.discountAmount)
        XCTAssertEqual(sut.netAmount, basket.netAmount)
        XCTAssertEqual(sut.collectionDate, basket.collectionDate?.iso8601Date)
        XCTAssertEqual(sut.collectionPreferenceType, CollectionPreferenceType.asap)
        XCTAssertEqual(sut.items?.count, basket.items?.count)
    }
}
