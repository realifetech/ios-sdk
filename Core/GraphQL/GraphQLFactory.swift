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
    static let urlSessionClient = URLSessionClient()

    static func makeGraphQLManager(
        deviceId: String,
        tokenHelper: APITokenManagable,
        graphQLAPIUrl: URL
    ) -> GraphQLManageable {
        let networkTransport = makeNetworkTransport(
            deviceId: deviceId,
            apiHelper: tokenHelper,
            graphQLAPIUrl: graphQLAPIUrl)
        GraphQLManager.shared = GraphQLManager(
            endpointUrl: graphQLAPIUrl,
            store: store,
            networkTransport: networkTransport,
            client: ApolloClient(networkTransport: networkTransport, store: store))
        return GraphQLManager.shared
    }

    static func makeNetworkTransport(
        deviceId: String,
        apiHelper: APITokenManagable,
        graphQLAPIUrl: URL
    ) -> NetworkTransport {
        var headers: [String: String] = ["X-Ls-DeviceId": deviceId]
        if apiHelper.tokenIsValid, let token = apiHelper.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return RequestChainNetworkTransport(
            interceptorProvider: GraphQLInterceptorProvider(
                store: store,
                client: urlSessionClient,
                tokenHelper: apiHelper,
                deviceId: deviceId),
            endpointURL: graphQLAPIUrl,
            additionalHeaders: headers)
    }
}
