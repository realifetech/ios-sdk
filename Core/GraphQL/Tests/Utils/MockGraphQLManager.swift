//
//  MockGraphQLManager.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 18/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo
@testable import RealifeTech

final class MockGraphQLManager<ResultDataType>: GraphQLManageable {

    var dispatchQueryIsCalled = false
    var numberOfQueriesCalled = 0
    var dispatchMutationIsCalled = false
    var resultReturns: Result<GraphQLResult<ResultDataType>, Error> = .failure(DummyError.failure)
    var newApiHelper: APITokenManagable?
    var receivedDeviceId: String?
    var didCallUpdateHeadersToNetworkTransport = false

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        dispatchQueryIsCalled = true
        numberOfQueriesCalled += 1
        if let result = resultReturns as? Result<GraphQLResult<Query.Data>, Error> {
            completion(result)
        } else {
            completion(.failure(DummyError.failure))
        }
    }

    func dispatchMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        cacheResultToPersistence: Bool,
        completion:  @escaping (Result<GraphQLResult<Mutation.Data>, Error>) -> Void
    ) {
        dispatchMutationIsCalled = true
        if let result = resultReturns as? Result<GraphQLResult<Mutation.Data>, Error> {
            completion(result)
        } else {
            completion(.failure(DummyError.failure))
        }
    }

    func clearAllCachedData(completion: (() -> Void)?) { }

    func updateHeadersToNetworkTransport(deviceId: String, apiHelper: APITokenManagable) {
        newApiHelper = apiHelper
        receivedDeviceId = deviceId
        didCallUpdateHeadersToNetworkTransport = true
    }
}
