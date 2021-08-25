//
//  SellFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech
@testable import GraphQL

final class SellFactoryTests: XCTestCase {

    func test_makeSellModule_returnsSellImplementing() {
        let graphQLManager = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
        let result = SellFactory.makeSellModule(graphQLManager: graphQLManager)
        XCTAssertTrue(result is SellImplementing)
        XCTAssertTrue(result.product is ProductRepository)
        XCTAssertTrue(result.basket is BasketRepository)
        XCTAssertTrue(result.order is OrderRepository)
        XCTAssertTrue(result.fulfilmentPoint is FulfilmentPointRepository)
        XCTAssertTrue(result.payment is PaymentRepository)
    }
}
