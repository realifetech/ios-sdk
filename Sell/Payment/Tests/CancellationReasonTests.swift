//
//  CancellationReasonTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class CancellationReasonTests: XCTestCase {

    private let cases: [(CancellationReason, ApolloType.CancellationReason)] = [
        (.duplicate, .duplicate),
        (.fraudulent, .fraudulent),
        (.requestedByCustomer, .requestedByCustomer),
        (.abandoned, .abandoned)
    ]

    func test_initWithApolloType_nonNilTypes_returnsType() {
        cases.forEach {
            XCTAssertEqual(CancellationReason(apolloType: $0.1), $0.0)
        }
    }

    func test_initWithApolloType_invalidTypes_returnsNil() {
        XCTAssertNil(CancellationReason(apolloType: .__unknown("invalid")))
    }

    func test_apolloType() {
        cases.forEach {
            XCTAssertEqual($0.0.apolloType, $0.1)
        }
    }
}
