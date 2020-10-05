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

struct OAuthRequester: JSONContentTypeHeaderRequestInserting, DeviceIdHeaderRequestInserting, Requester {
    static var endpoint: String? = "/oauth/v2/token"
    static var apiHeaderVariableStore: SharedApiHeaderVaribleStorage.Type = ApiHeaderVariables.self
    private static var defaultOAuthParameters: [String: Any] = [:]
}

extension OAuthRequester {
    // MARK: Setup

    /// Must be called during setup. Provides secrets for getting initial access token.
    static func setDefaultOAuthParameters(clientId: String, clientSecret: String) {
        defaultOAuthParameters = [
            "client_id": clientId,
            "client_secret": clientSecret
        ]
    }

    // MARK: Implementing Requester

    static func root() -> RequestRootURL {
        return RequestBaseURL.LSBaseURLV3
    }

    static func dateFormat() -> RequesterDateFormat? {
        return .formatted(format: "yyyy-MM-dd'T'HH:mm:ssZ", localeIdentifier: "en_US_POSIX")
    }

    static func preDispatchAction() -> Observable<Any?>? { return nil } // Otherwise it will infinitely try to refresh the access token

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        return [
            addJSONContentTypeHeader,
            addDeviceIdHeader,
            addAuthorisationHeader
        ]
    }

    private static func addAuthorisationHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        guard apiHeaderVariableStore.sharedInstance.tokenIsValid, let accessToken = apiHeaderVariableStore.sharedInstance.token else { return request }
        let oAuthHeader = RequestHeader.generateAuthHeader(accessToken: accessToken)
        request.addValue(oAuthHeader.valueForHeader, forHTTPHeaderField: oAuthHeader.header)
        return request
    }

    // MARK: Generate Requests

    static func requestInitialAccessToken() -> URLRequest {
        var parameters = defaultOAuthParameters
        parameters["grant_type"] = "client_credentials"
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint!,
            httpMethod: .POST,
            body: parameters)
    }
}
