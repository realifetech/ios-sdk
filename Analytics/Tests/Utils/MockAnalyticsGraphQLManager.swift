//
//  MockAnalyticsGraphQLManager.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo
@testable import RealifeTech

final class MockAnalyticsGraphQLManager: GraphQLManageable {

    var shouldReturnFailure = false
    var successReturns = true
    var dispatchMutationIsCalled = false

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }

    func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        dispatchMutationIsCalled = true
        if shouldReturnFailure {
            completion(.failure(DummyError.failure))
        } else {
            let putAnalyticEvent = ApolloType.PutAnalyticEventMutation.Data.PutAnalyticEvent(success: successReturns)
            let data = ApolloType.PutAnalyticEventMutation.Data(putAnalyticEvent: putAnalyticEvent)
            let result = GraphQLResult<Query.Data>(
                data: data as? Query.Data,
                extensions: nil,
                errors: nil,
                source: .server,
                dependentKeys: nil)
            completion(.success(result))
        }
    }

    func clearAllCache() { }
}
