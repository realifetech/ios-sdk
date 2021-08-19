//
//  SellImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 19/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class SellImplementingTests: XCTestCase {

    func test_createOrderingJourneyViewController() {
        let graphQLManager = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
        let sut = SellFactory.makeSellModule(graphQLManager: graphQLManager)
        XCTAssertTrue(sut.createOrderingJourneyViewController() is OrderingJourneyViewController)
    }

    func test_createOrderingJourneyView() {
        let graphQLManager = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
        let sut = SellFactory.makeSellModule(graphQLManager: graphQLManager)
        let view = sut.createOrderingJourneyView()
        XCTAssertNotNil(view.urlRequest.url)
    }
}
