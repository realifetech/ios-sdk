//
//  OAuthRequester.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 13/11/2017.
//  Copyright © 2017 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift

struct OAuthRequester: Requester {
    static var endpoint: String = "/oauth/v2/token"
    private static var defaultOAuthParameters: [String: Any] = [:]
}

extension OAuthRequester: JSONContentTypeHeaderRequestInserting, DeviceIdHeaderRequestInserting, OAuthHeaderRequestInserting {

    /// Must be called during setup. Provides secrets for getting initial access token.
    static func setDefaultOAuthParameters(clientId: String, clientSecret: String) {
        defaultOAuthParameters = [
            "client_id": clientId + "_0",
            "client_secret": clientSecret
        ]
    }

    // MARK: - Implementing Requester

    static func root() -> String {
        return APIRequesterHelper.baseUrl
    }

    static func dateFormat() -> RequesterDateFormat? {
        return .formatted(format: "yyyy-MM-dd'T'HH:mm:ssZ", localeIdentifier: "en_US_POSIX")
    }

    static func preDispatchAction() -> Observable<Any?>? { return nil }

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        return [
            addJSONContentTypeHeader,
            addDeviceIdHeader,
            addOAuthHeader
        ]
    }

    // MARK: - Generate Requests

    static func requestInitialAccessToken() -> URLRequest {
        var parameters = defaultOAuthParameters
        parameters["grant_type"] = "client_credentials"
        return makeOAuthUrlRequest(with: parameters)
    }

    static func refreshAccessToken(_ refreshToken: String) -> URLRequest {
        var parameters = defaultOAuthParameters
        parameters["grant_type"] = "refresh_token"
        parameters["refresh_token"] = refreshToken
        return makeOAuthUrlRequest(with: parameters)
    }

    private static func makeOAuthUrlRequest(with body: [String: Any]) -> URLRequest {
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint,
            httpMethod: .POST,
            body: body)
    }
}
