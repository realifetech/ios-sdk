//
//  PaymentStatusTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class PaymentStatusTests: XCTestCase {

    func test_initWithApolloType() {
        let cases: [(PaymentStatus, ApolloType.PaymentStatus)] = [
            (.requiresPaymentMethod, .requiresPaymentMethod),
            (.requiresAction, .requiresAction),
            (.processing, .processing),
            (.succeeded, .succeeded),
            (.canceled, .canceled),
            (.unknown, .__unknown("invalid!!!!"))
        ]
        cases.forEach {
            XCTAssertEqual(PaymentStatus(apolloType: $0.1), $0.0)
        }
    }
}
