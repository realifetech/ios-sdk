//
//  ResponseInterceptor.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/5/17.
//

import Foundation
import Apollo

class ResponseInterceptor: ApolloInterceptor {

    private let tokenHelper: APITokenManagable

    init(tokenHelper: APITokenManagable) {
        self.tokenHelper = tokenHelper
    }

    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            if let graphQLErrorCode = try? convertToGraphQLErrorCode(response?.rawData),
               graphQLErrorCode == .unauthenticated {
                tokenHelper.getValidToken { result in
                    switch result {
                    case .success(_) :
                        chain.retry(request: request, completion: completion)
                    case .failure(let error):
                        chain.handleErrorAsync(
                            error,
                            request: request,
                            response: response,
                            completion: completion)
                    }
                }
            } else {
                chain.proceedAsync(
                    request: request,
                    response: response,
                    completion: completion)
            }
    }

    // Note: When access token expired, GraphQL response returns this error:
    /*
     { "errors": [
           { "message": "Context creation failed: Access denied: Invalid auth token",
             "extensions": {
               "code": "UNAUTHENTICATED",
                ...
             }}]
     }
     */
    private func convertToGraphQLErrorCode(_ data: Data?) throws -> GraphQLErrorCode? {
        do {
            guard let data = data,
                  let json = try? JSONSerializationFormat.deserialize(data: data) as? JSONObject,
                  let errors = json["errors"] as? [JSONObject],
                  let firstGraphQLErrorJson = errors.first,
                  let extensions = GraphQLError(firstGraphQLErrorJson).extensions,
                  let code = extensions["code"] as? String
            else {
                return nil
            }
            return GraphQLErrorCode(rawValue: code)
        }
    }
}
