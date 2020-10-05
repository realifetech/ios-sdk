//
//  OAuthRequester.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 13/11/2017.
//  Copyright © 2017 ConcertLive. All rights reserved.
//
import Foundation
import APILayer
import RxSwift

struct OAuthRequester: Requester, APIV3Requester {
    static var endpoint: String? = "/oauth/v2/token"
    static var apiHeaderVariableStore: SharedApiHeaderVaribleStorage.Type = ApiHeaderVariables.self
    private static var defaultOAuthParameters: [String: Any] = [:]
}

extension OAuthRequester {
    static func preDispatchAction() -> Observable<Any?>? { return nil } // Otherwise it will infinitely try to refresh the access token

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        func addOAuthHeader(toRequest request: URLRequest) -> URLRequest {
            // This has a custom implementation, as we don't want to add Basic/credentialString for open calls
            var request = request
            guard apiHeaderVariableStore.sharedInstance.tokenIsValid, let accessToken = apiHeaderVariableStore.sharedInstance.token else { return request }
            let oAuthHeader = RequestHeader.generateAuthHeader(accessToken: accessToken)
            request.addValue(oAuthHeader.valueForHeader, forHTTPHeaderField: oAuthHeader.header)
            return request
        }
        return [
            addJSONContentTypeHeader,
            addDeviceIdHeader,
            addOAuthHeader
        ]
    }

    static func setDefaultOAuthParameters(clientId: String, clientSecret: String) {
        defaultOAuthParameters = [
            "client_id": clientId,
            "client_secret": clientSecret
        ]
    }

    static func requestInitialAccessToken() -> URLRequest {
        var parameters = defaultOAuthParameters
        parameters["grant_type"] = "client_credentials"
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint!,
            httpMethod: .POST,
            body: defaultOAuthParameters)
    }
}
