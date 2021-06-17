//
//  MockAudienceGraphQLManager.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo
@testable import RealifeTech

final class MockAudienceGraphQLManager: GraphQLManageable {

    var dispatchQueryIsCalled = false

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        dispatchQueryIsCalled = true
    }

    func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }

    func clearAllCachedData() { }
}
