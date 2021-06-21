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

final class SellFactoryTests: XCTestCase {

    func test_makeSellModule_returnsSellImplementing() {
        let result = SellFactory.makeSellModule(graphQLDispatcher: MockGraphQLDispatcher())
        XCTAssertTrue(result is SellImplementing)
        XCTAssertTrue(result.product is ProductRepository)
    }
}

private final class MockGraphQLDispatcher: GraphQLDispatching {

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }

    func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }
}
