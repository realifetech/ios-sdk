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
    let deviceId: String

    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            LegacyCacheReadInterceptor(store: store),
            NetworkFetchInterceptor(client: client),
            RequestLoggingInterceptor(),
            APITokenInterceptor(tokenHelper: tokenHelper, deviceId: deviceId),
            ResponseCodeInterceptor(),
            LegacyParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
            LegacyCacheWriteInterceptor(store: store)
        ]
    }
}
