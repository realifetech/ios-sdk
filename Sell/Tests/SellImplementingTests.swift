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

    private var sut: SellImplementing!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let graphQLManager = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
        let sell = SellFactory.makeSellModule(
            graphQLManager: graphQLManager,
            orderingJourneyUrl: "",
            colorStore: EmptyColorStore())
        sut = try XCTUnwrap(sell as? SellImplementing)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_createOrderingJourneyViewController() {
        XCTAssertTrue(sut.createOrderingJourneyViewController() is OrderingJourneyViewController)
    }

    func test_createOrderingJourneyView() {
        let view = sut.createOrderingJourneyView()
        XCTAssertNotNil(view.urlRequest.url)
    }
}
