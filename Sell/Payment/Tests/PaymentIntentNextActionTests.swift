//
//  PaymentIntentNextActionTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class PaymentIntentNextActionTests: XCTestCase {

    func test_initWithResponse_hasValidActionType_returnsValue() throws {
        let response = ApolloType.FragmentPaymentIntent.NextAction(type: .collectCvc, url: "url")
        let sut = try XCTUnwrap(PaymentIntentNextAction(response: response))
        XCTAssertEqual(sut.type, PaymentActionType(apolloType: response.type))
        XCTAssertEqual(sut.url, response.url)
    }

    func test_initWithResponse_nilResponse_returnsNil() {
        XCTAssertNil(PaymentIntentNextAction(response: nil))
    }

    func test_initWithResponse_unknownActionType_returnsNil() {
        let response = ApolloType.FragmentPaymentIntent.NextAction(type: .__unknown("invalid"), url: "url")
        XCTAssertNil(PaymentIntentNextAction(response: response))
    }
}
