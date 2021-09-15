//
//  GraphQLFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public class GraphQLFactory {

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

    static let networkTransport: RequestChainNetworkTransport? = {
        var headers: [String: String] = ["X-Ls-DeviceId": deviceId]
        guard let tokenHelper = tokenHelper, let graphQLAPIUrl = graphQLAPIUrl else {
            return nil
        }
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

    static var deviceId: String = ""
    static var tokenHelper: APITokenManagable?
    static var graphQLAPIUrl: URL?
    static var client: ApolloClient?

    static func makeGraphQLManager(
        deviceId: String,
        tokenHelper: APITokenManagable,
        graphQLAPIUrl: URL
    ) -> GraphQLManageable? {
        self.deviceId = deviceId
        self.tokenHelper = tokenHelper
        self.graphQLAPIUrl = graphQLAPIUrl
        guard let networkTransport = networkTransport else { return nil }
        client = ApolloClient(networkTransport: networkTransport, store: store)
        guard let client = client else { return nil }
        return GraphQLManager(client: client)
    }
}
