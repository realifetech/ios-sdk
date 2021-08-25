//
//  OrderTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class OrderTypeTests: XCTestCase {

    private let cases: [(OrderType, ApolloType.OrderType)] = [
        (.foodAndBeverage, .foodAndBeverage),
        (.ticket, .ticket),
        (.unknown, .__unknown(""))
    ]

    func test_initWithApolloType() {
        cases.forEach {
            XCTAssertEqual(OrderType(apolloType: $0.1), $0.0)
        }
    }

    func test_apolloType() {
        cases.forEach {
            XCTAssertEqual($0.0.apolloType, $0.1)
        }
    }
}
