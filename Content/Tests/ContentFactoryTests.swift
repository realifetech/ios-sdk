//
//  ContentFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class ContentFactoryTests: XCTestCase {

    func test_makeContentModule_setGraphQLDispatcher() {
        let sut = ContentFactory.makeContentModule(graphQLDispatcher: MockGraphQLDispatcher())
        XCTAssertTrue((sut as? ContentImplementing)?.dispatcher is MockGraphQLDispatcher)
    }

    private final class MockGraphQLDispatcher: GraphQLDispatching {

        func dispatch<Query: GraphQLQuery>(
            query: Query,
            cachePolicy: GraphNetworkCachePolicy,
            completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
        ) { }

        func dispatchMutation<Query: GraphQLMutation>(
            mutation: Query,
            completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
        ) { }
    }
}
