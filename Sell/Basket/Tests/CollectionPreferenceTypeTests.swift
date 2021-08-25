//
//  CollectionPreferenceTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class CollectionPreferenceTypeTests: XCTestCase {

    func test_initWithApolloType_nonUnknownType_returnValidType() {
        let cases: [(CollectionPreferenceType, ApolloType.CollectionPreferenceType)] = [
            (.asap, .asap),
            (.preorder, .preorder),
            (.checkin, .checkin)
        ]
        cases.forEach {
            XCTAssertEqual(CollectionPreferenceType(apolloType: $0.1), $0.0)
        }
    }

    func test_initWithApolloType_unknownType_returnNil() {
        XCTAssertNil(CollectionPreferenceType(apolloType: .__unknown("")))
    }

    func test_initWithApolloType_nilType_returnNil() {
        XCTAssertNil(CollectionPreferenceType(apolloType: nil))
    }

    func test_apolloType() {
        let cases: [(CollectionPreferenceType, ApolloType.CollectionPreferenceType)] = [
            (.asap, .asap),
            (.preorder, .preorder),
            (.checkin, .checkin)
        ]
        cases.forEach {
            XCTAssertEqual(CollectionPreferenceType(apolloType: $0.1)?.apolloType, $0.1)
        }
    }
}
