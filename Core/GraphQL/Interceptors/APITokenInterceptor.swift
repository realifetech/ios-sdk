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

    init(tokenHelper: APITokenManagable) {
        self.tokenHelper = tokenHelper
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        if let token = tokenHelper.token, tokenHelper.tokenIsValid {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion)
    }
}
