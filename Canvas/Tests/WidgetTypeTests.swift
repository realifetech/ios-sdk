//
//  WidgetTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class WidgetTypeTests: XCTestCase {

    func test_initWithApolloType_validTypes_returnsType() {
        let cases: [(WidgetType, ApolloType.WidgetType)] = [
            (.product, .product),
            (.button, .button),
            (.banner, .banner),
            (.event, .event),
            (.fixture, .fixture),
            (.countdownClock, .countdownClock),
            (.galleryCoverImage, .galleryCoverImage),
            (.news, .news),
            (.ticket, .ticket),
            (.ticketProduct, .ticketProduct),
            (.fulfilmentPoint, .fulfilmentPoint),
            (.socialPost, .socialPost),
            (.fulfilmentPointCategorySelector, .fulfilmentPointCategorySelector),
            (.selectedEvent, .selectedEvent)
        ]
        cases.forEach {
            XCTAssertEqual(WidgetType(apolloType: $0.1), $0.0)
        }
    }

    func test_initWithApolloType_unknownType_returnsNil() {
        XCTAssertNil(WidgetType(apolloType: .__unknown("")))
    }

    func test_initWithApolloType_nilType_returnsNil() {
        XCTAssertNil(WidgetType(apolloType: nil))
    }
}
