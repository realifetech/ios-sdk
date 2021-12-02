//
//  APITokenInterceptor.swift
//  RealifeTech-CoreSDK
//
//  Created by Mickey Lee on 02/02/2021.
//

import Foundation
import Apollo

class APITokenInterceptor: ApolloInterceptor {

    private let tokenHelper: APITokenManagable
    private let graphQLManager: GraphQLManageable
    private let deviceId: String

    init(
        tokenHelper: APITokenManagable,
        graphQLManager: GraphQLManageable = GraphQLManager.shared,
        deviceId: String
    ) {
        self.tokenHelper = tokenHelper
        self.graphQLManager = graphQLManager
        self.deviceId = deviceId
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        guard let receivedResponse = response else {
            chain.handleErrorAsync(
                ResponseCodeInterceptor.ResponseCodeError.invalidResponseCode(
                    response: response?.httpResponse,
                    rawData: response?.rawData),
                request: request,
                response: response,
                completion: completion)
            return
        }
        if let error = receivedResponse.parsedResponse?.errors?.first,
           let errorCode = error.extensions?["code"] as? String,
           errorCode == "UNAUTHENTICATED" {
            tokenHelper.getValidToken { [self] _ in
                guard let token = tokenHelper.token, tokenHelper.tokenIsValid else { return }
                graphQLManager.updateHeadersToNetworkTransport(
                    deviceId: deviceId,
                    apiHelper: tokenHelper)
                request.addHeader(name: "Authorization", value: "Bearer \(token)")
                chain.retry(request: request, completion: completion)
            }
        } else {
            chain.proceedAsync(
                request: request,
                response: response,
                completion: completion)
        }
    }
}
