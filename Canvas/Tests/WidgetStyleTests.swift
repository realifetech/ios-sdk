//
//  WidgetStyleTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class WidgetStyleTests: XCTestCase {

    func test_publicInitialser() {
        let sut = WidgetStyle(
            type: .carousel,
            size: .small,
            padded: true)
        XCTAssertEqual(sut.type, .carousel)
        XCTAssertEqual(sut.size, .small)
        XCTAssertTrue(sut.padded)
    }

    func test_styleTypeInitWithApolloType_validTypes_returnsType() {
        let cases: [(StyleType, ApolloType.StyleType)] = [
            (.pager, .pager),
            (.carousel, .carousel),
            (.list, .list)
        ]
        cases.forEach {
            XCTAssertEqual(StyleType(apolloType: $0.1), $0.0)
        }
    }

    func test_styleTypeInitWithApolloType_unknownType_returnsList() {
        XCTAssertEqual(StyleType(apolloType: .__unknown("")), .list)
    }

    func test_styleTypeInitWithApolloType_nilType_returnsList() {
        XCTAssertEqual(StyleType(apolloType: nil), .list)
    }

    func test_styleSizenitWithApolloType_validTypes_returnsType() {
        let cases: [(StyleSize, ApolloType.StyleSize)] = [
            (.small, .small),
            (.medium, .medium),
            (.large, .large)
        ]
        cases.forEach {
            XCTAssertEqual(StyleSize(apolloType: $0.1), $0.0)
        }
    }

    func test_styleSizeInitWithApolloType_unknownType_returnsSmall() {
        XCTAssertEqual(StyleSize(apolloType: .__unknown("")), .small)
    }

    func test_styleSizeInitWithApolloType_nilType_returnsSmall() {
        XCTAssertEqual(StyleSize(apolloType: nil), .small)
    }
}
