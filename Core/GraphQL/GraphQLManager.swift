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
    func dispatchMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        cacheResultToPersistence: Bool,
        completion:  @escaping (Result<GraphQLResult<Mutation.Data>, Error>) -> Void
    )
    func clearAllCachedData(completion: (() -> Void)?)
}

public class GraphQLManager {

    public static var shared: GraphQLManager!

    private(set) var networkTransport: NetworkTransport

    public let endpointUrl: URL
    private let store: ApolloStore
    private let client: ApolloClient

    public init(
        endpointUrl: URL,
        store: ApolloStore,
        networkTransport: NetworkTransport,
        client: ApolloClient
    ) {
        self.endpointUrl = endpointUrl
        self.store = store
        self.networkTransport = networkTransport
        self.client = client
    }
}

extension GraphQLManager: GraphQLManageable {

    public func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        client.fetch(
            query: query,
            cachePolicy: cachePolicy.apolloCachePolicyType
        ) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    public func dispatchMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        cacheResultToPersistence: Bool,
        completion:  @escaping (Result<GraphQLResult<Mutation.Data>, Error>) -> Void
    ) {
        client.perform(
            mutation: mutation,
            publishResultToStore: cacheResultToPersistence
        ) { result in
            switch result {
            case .success(let graphQLResult):
                return completion(.success(graphQLResult))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }

    public func clearAllCachedData(completion: (() -> Void)?) {
        client.clearCache(callbackQueue: .main) { _ in
            completion?()
        }
    }
}
