//
//  GraphQLFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public struct GraphQLFactory {

    static let store: ApolloStore = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .libraryDirectory,
            .userDomainMask,
            true).first ?? ""
        let documentsUrl = URL(fileURLWithPath: documentsPath)
        let sqliteFileUrl = documentsUrl.appendingPathComponent("realifetech_core_apollo_db.sqlite")
        let sqliteCache = try? SQLiteNormalizedCache(fileURL: sqliteFileUrl)
        return ApolloStore(cache: sqliteCache ?? InMemoryNormalizedCache())
    }()

    static func makeGraphQLManager(
        deviceId: String,
        tokenHelper: APITokenManagable,
        graphQLAPIUrl: URL
    ) -> GraphQLManageable {
        var headers: [String: String] = ["X-Ls-DeviceId": deviceId]
        if tokenHelper.tokenIsValid, let token = tokenHelper.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: GraphQLInterceptorProvider(
                store: store,
                client: URLSessionClient(),
                tokenHelper: tokenHelper),
            endpointURL: graphQLAPIUrl,
            additionalHeaders: headers)
        GraphQLManager.shared = GraphQLManager(
            endpointUrl: graphQLAPIUrl,
            store: store,
            networkTransport: networkTransport,
            client: ApolloClient(networkTransport: networkTransport, store: store))
        return GraphQLManager.shared
    }
}
