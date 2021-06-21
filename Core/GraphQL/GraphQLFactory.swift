//
//  GraphQLFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public enum GraphQLFactory {

    static func makeGraphQLManager(
        deviceId: String,
        tokenHelper: APITokenManagable,
        graphQLAPIUrl: URL
    ) -> GraphQLManageable {
        let store: ApolloStore = {
            let documentsPath = NSSearchPathForDirectoriesInDomains(
                .libraryDirectory,
                .userDomainMask,
                true).first ?? ""
            let documentsUrl = URL(fileURLWithPath: documentsPath)
            let sqliteFileUrl = documentsUrl.appendingPathComponent("realifetech_core_apollo_db.sqlite")
            let sqliteCache = try? SQLiteNormalizedCache(fileURL: sqliteFileUrl)
            return ApolloStore(cache: sqliteCache ?? InMemoryNormalizedCache())
        }()
        let networkTransport: RequestChainNetworkTransport = {
            var headers: [String: String] = ["X-Ls-DeviceId": deviceId]
            if tokenHelper.tokenIsValid, let token = tokenHelper.token {
                headers["Authorization"] = "Bearer \(token)"
            }
            let transport = RequestChainNetworkTransport(
                interceptorProvider: GraphQLInterceptorProvider(
                    store: store,
                    client: URLSessionClient(),
                    tokenHelper: tokenHelper),
                endpointURL: graphQLAPIUrl,
                additionalHeaders: headers)
            return transport
        }()
        let client = ApolloClient(networkTransport: networkTransport, store: store)
        return GraphQLManager(client: client)
    }
}
