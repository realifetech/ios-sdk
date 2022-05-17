//
//  GraphQLInterceptorProvider.swift
//  RealifeTech-CoreSDK
//
//  Created by Mickey Lee on 02/02/2021.
//

import Foundation
import Apollo

struct GraphQLInterceptorProvider: InterceptorProvider {

    let store: ApolloStore
    let client: URLSessionClient
    let tokenHelper: APITokenManagable

    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            APITokenInterceptor(tokenHelper: tokenHelper),
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: store),
            NetworkFetchInterceptor(client: client),
            RequestLoggingInterceptor(),
            ResponseInterceptor(tokenHelper: tokenHelper),
            JSONResponseParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
            CacheWriteInterceptor(store: store)
        ]
    }
}
