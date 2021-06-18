//
//  MockContentGraphQLManager.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo
@testable import RealifeTech

let dummyUrl = "https://www.google.com"

enum DummyError: Error {
    case failure
}

final class MockContentGraphQLManager: GraphQLManageable {

    var shouldReturnNormalError = false
    var shouldReturnNilUrl = false
    var shouldReturnConstructionError = false

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        if shouldReturnNormalError {
            completion(.failure(DummyError.failure))
        } else {
            let url = shouldReturnConstructionError ? "" : dummyUrl
            let getWebPageType = ApolloType.GetWebPageByTypeQuery.Data.GetWebPageByType(url: url)
            let data = ApolloType.GetWebPageByTypeQuery.Data(
                getWebPageByType: shouldReturnNilUrl ? nil : getWebPageType)
            let result = GraphQLResult<Query.Data>(
                data: data as? Query.Data,
                extensions: nil,
                errors: nil,
                source: .cache,
                dependentKeys: nil)
            completion(.success(result))
        }
    }

    func dispatchMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        completion:  @escaping (Result<GraphQLResult<Mutation.Data>, Error>) -> Void
    ) { }

    func clearAllCache() { }
}
