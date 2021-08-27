//
//  WidgetTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class WidgetTests: XCTestCase {

    func test_publicInitialser() {
        let sut = Widget(
            id: "1",
            widgetType: nil,
            style: nil,
            viewAllUrl: nil,
            variation: nil)
        XCTAssertEqual(sut.id, "1")
        XCTAssertNil(sut.widgetType)
        XCTAssertNil(sut.style)
        XCTAssertNil(sut.viewAllUrl)
        XCTAssertNil(sut.variation)
    }

    func test_initWithFragment_hasResponse_returnsWidget() throws {
        let fragment = ApolloType.FragmentWidget(
            id: "1",
            style: ApolloType.FragmentWidget.Style(
                type: .list,
                size: .medium,
                padded: nil),
            viewAllUrl: "A",
            widgetType: .banner,
            variation: ApolloType.FragmentWidget.Variation(
                fetchType: .featured,
                contentIds: ["a", "b", "c"],
                params: [ApolloType.FragmentWidget.Variation.Param(key: "key", value: "value")],
                engagementParams: [ApolloType.FragmentWidget.Variation.EngagementParam(key: "key", value: "value")],
                translations: [ApolloType.FragmentWidget.Variation.Translation(language: .en, title: "B")]
            )
        )
        let sut = try XCTUnwrap(Widget(response: fragment))
        XCTAssertEqual(sut.id, fragment.id)
        XCTAssertEqual(sut.style?.type, StyleType(apolloType: .list))
        XCTAssertEqual(sut.style?.size, StyleSize(apolloType: .medium))
        XCTAssertFalse(sut.style?.padded ?? true)
        XCTAssertEqual(sut.viewAllUrl, fragment.viewAllUrl)
        XCTAssertEqual(sut.widgetType, WidgetType(apolloType: fragment.widgetType))
        XCTAssertNotNil(sut.variation)
    }

    func test_initWithFragment_nilResponse_returnsNil() {
        XCTAssertNil(Widget(response: nil))
    }
}
