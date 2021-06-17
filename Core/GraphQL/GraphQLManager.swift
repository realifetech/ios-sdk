//
//  GraphQLManager.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public protocol GraphQLManageable {
    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    )
    func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    )
    func clearAllCache()
}

public class GraphQLManager {

    private let client: ApolloClient

    public init(client: ApolloClient) {
        self.client = client
    }
}

extension GraphQLManager: GraphQLManageable {

    public func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        client.fetch(query: query, cachePolicy: cachePolicy.apolloCachePolicyType) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    public func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        client.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    public func clearAllCache() {
        client.clearCache()
    }
}
