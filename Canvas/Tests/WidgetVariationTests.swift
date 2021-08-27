//
//  WidgetVariationTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class WidgetVariationTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = WidgetVariation(
            fetchType: nil,
            contentIds: nil,
            translations: nil,
            params: nil,
            engagementParams: nil)
        XCTAssertNil(sut.fetchType)
        XCTAssertNil(sut.contentIds)
        XCTAssertNil(sut.translations)
        XCTAssertNil(sut.params)
        XCTAssertNil(sut.engagementParams)
    }

    func test_initWithFragment() {
        let fragment = ApolloType.FragmentWidget.Variation(
            fetchType: .featured,
            contentIds: ["1"],
            params: [ApolloType.FragmentWidget.Variation.Param(key: "key", value: "value")],
            engagementParams: [ApolloType.FragmentWidget.Variation.EngagementParam(key: "key", value: "value")],
            translations: [ApolloType.FragmentWidget.Variation.Translation(language: .en, title: "A")])
        let sut = WidgetVariation(response: fragment)
        XCTAssertEqual(sut.fetchType?.rawValue, fragment.fetchType?.rawValue)
        XCTAssertEqual(sut.contentIds, fragment.contentIds)
        XCTAssertEqual(sut.translations?.first?.language, "en")
        XCTAssertEqual(sut.translations?.first?.title, "A")
        XCTAssertEqual(sut.params?.first?.key, fragment.params?.first?.underlying?.key)
        XCTAssertEqual(sut.params?.first?.value, fragment.params?.first?.underlying?.value)
        XCTAssertEqual(sut.engagementParams?.first?.key, fragment.engagementParams?.first?.underlying?.key)
        XCTAssertEqual(sut.engagementParams?.first?.value, fragment.engagementParams?.first?.underlying?.value)
    }
}
