//
//  OrderTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class OrderTests: XCTestCase {

    private let orderStateString = OrderModelTestsHelper.orderStateString
    private let paymentStatusString = OrderModelTestsHelper.paymentStatusString

    func test_publicIntialiser() {
        let id = "1"
        let sut = Order(
            id: id,
            orderNumber: id,
            qrCodeUrl: "B",
            collectionDate: Date(),
            status: OrderStatus.complete.rawValue,
            state: OrderState(
                status: orderStateString,
                workingState: orderStateString,
                translations: [
                    StandardDescriptionTranslation(
                        language: "en",
                        title: orderStateString,
                        description: orderStateString)
                ]),
            paymentStatus: paymentStatusString,
            grossAmount: 10,
            discountAmount: 10,
            netAmount: 100,
            createdAt: Date(),
            estimatedAt: Date(),
            collectionPreferenceType: .asap,
            seatInfo: nil,
            items: nil,
            timeslot: nil,
            fulfilmentPoint: nil)
        XCTAssertEqual(sut.id, id)
        XCTAssertEqual(sut.orderNumber, id)
        XCTAssertEqual(sut.state?.status, orderStateString)
        XCTAssertEqual(sut.state?.workingState, orderStateString)
        XCTAssertEqual(sut.state?.translations?.first?.title, orderStateString)
        XCTAssertEqual(sut.state?.translations?.first?.description, orderStateString)
        XCTAssertEqual(sut.paymentStatus, paymentStatusString)
        XCTAssertEqual(sut.netAmount, 100)
    }

    func test_initWithApolloFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = OrderModelTestsHelper.makeFragmentOrder()
        let sut = try XCTUnwrap(Order(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.orderNumber, fragment.orderNumber)
        XCTAssertEqual(sut.qrCodeUrl, fragment.qrCodeUrl)
        XCTAssertEqual(sut.collectionDate, fragment.collectionDate?.iso8601Date)
        XCTAssertEqual(sut.status, OrderStatus.inProgress.rawValue)
        XCTAssertEqual(sut.state?.workingState, fragment.state?.workingState)
        XCTAssertEqual(sut.state?.status, fragment.state?.status)
        XCTAssertEqual(sut.state?.translations?.first?.title, fragment.state?.translations?.first?.underlying?.title)
        XCTAssertEqual(sut.paymentStatus, fragment.paymentStatus?.rawValue)
        XCTAssertEqual(sut.grossAmount, fragment.grossAmount)
        XCTAssertEqual(sut.discountAmount, fragment.discountAmount)
        XCTAssertEqual(sut.netAmount, fragment.netAmount)
        XCTAssertEqual(sut.createdAt, fragment.createdAt?.iso8601Date)
        XCTAssertEqual(sut.estimatedAt, fragment.estimatedAt?.iso8601Date)
        XCTAssertEqual(sut.items?.count, fragment.items?.count)
        XCTAssertEqual(sut.items?.first?.id, fragment.items?.first?.underlying?.id)
    }

    func test_initWithApolloFragment_nilResponse_returnsNil() {
        XCTAssertNil(Order(response: nil))
    }

}
