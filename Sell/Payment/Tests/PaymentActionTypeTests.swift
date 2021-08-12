//
//  PaymentActionTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class PaymentActionTypeTests: XCTestCase {

    func test_initWithApolloType_knownTypes_returnsValidType() {
        let cases: [(PaymentActionType, ApolloType.PaymentActionType)] = [
            (.redirectToUrl, .redirectToUrl),
            (.collectCvc, .collectCvc)
        ]
        cases.forEach {
            XCTAssertEqual(PaymentActionType(apolloType: $0.1), $0.0)
        }
    }

    func test_initWithApolloType_unknownTypes_returnsNil() {
        XCTAssertNil(PaymentActionType(apolloType: .__unknown("invalid!!!!")))
    }
}
