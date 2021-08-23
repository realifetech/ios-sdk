//
//  PaymentIntentTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class PaymentIntentTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = PaymentIntent(
            id: "1",
            orderType: .foodAndBeverage,
            orderId: "1",
            status: .processing,
            paymentSource: nil,
            amount: 100,
            currency: "en_GB",
            livemode: false,
            cancellationReason: .abandoned,
            savePaymentSource: false,
            nextAction: PaymentIntentNextAction(type: .redirectToUrl, url: nil),
            lastPaymentError: nil)
        XCTAssertEqual(sut.id, "1")
        XCTAssertEqual(sut.orderType, .foodAndBeverage)
        XCTAssertEqual(sut.orderId, "1")
        XCTAssertEqual(sut.amount, 100)
        XCTAssertEqual(sut.nextAction?.type, .redirectToUrl)
    }

    func test_initWithFragment_nonNilResponse_returnsValidValue() throws {
        let fragment = ApolloType.FragmentPaymentIntent(
            id: "1",
            orderType: .foodAndBeverage,
            orderId: "1",
            status: .succeeded,
            paymentSource: nil,
            amount: 100,
            currency: "en_GB",
            livemode: false,
            cancellationReason: nil,
            savePaymentSource: nil,
            nextAction: nil,
            lastPaymentError: nil)
        let sut = try XCTUnwrap(PaymentIntent(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.orderType.apolloType, fragment.orderType)
        XCTAssertEqual(sut.orderId, fragment.orderId)
        XCTAssertEqual(sut.status, .succeeded)
        XCTAssertEqual(sut.amount, fragment.amount)
        XCTAssertEqual(sut.currency, fragment.currency)
        XCTAssertEqual(sut.livemode, fragment.livemode)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(PaymentIntent(response: nil))
    }
}
