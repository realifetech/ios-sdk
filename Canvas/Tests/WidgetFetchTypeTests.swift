//
//  WidgetFetchTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class WidgetFetchTypeTests: XCTestCase {

    func test_initWithApolloType_validTypes_returnsType() {
        let cases: [(WidgetFetchType, ApolloType.WidgetFetchType)] = [
            (.featured, .featured),
            (.feed, .feed),
            (.static, .static)
        ]
        cases.forEach {
            XCTAssertEqual(WidgetFetchType(apolloType: $0.1), $0.0)
        }
    }

    func test_initWithApolloType_unknownType_returnsNil() {
        XCTAssertNil(WidgetFetchType(apolloType: .__unknown("")))
    }

    func test_initWithApolloType_nilType_returnsNil() {
        XCTAssertNil(WidgetFetchType(apolloType: nil))
    }
}
