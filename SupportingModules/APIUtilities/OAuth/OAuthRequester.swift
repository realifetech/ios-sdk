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

struct OAuthRequester: Requester, APIV3Requester, DeviceIdHeaderRequestInserting {
    static var endpoint: String? = "/oauth/v2/token"
}
extension OAuthRequester {
    static func preDispatchAction() -> Observable<Any?>? { return nil } //Otherwise it will infinitely try to refresh the access token

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        func addOAuthHeader(toRequest request: URLRequest) -> URLRequest {  //This has a custom implementation, as we don't want to add Basic/credentialString for open calls
            var request = request
            guard UserAuthenticator.accessTokenValid == true, let accessToken = UserAuthenticator.accessToken else { return request }
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
    static func getDefaultOAuthParameters() -> [String: Any] {
        // Both of these come from the Environments.plist
        return ["client_id": "LS_0",
            // TODO: Add access to some envrionmental variables store. EnvironmentVariableAccessor.sharedInstance.oAuthCodeV3,
                "client_secret": "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C"
            // TODO: Add access to some envrionmental variables store. EnvironmentVariableAccessor.sharedInstance.oAuthClientSecretV3
        ]
    }
    static func requestInitialAccessToken() -> URLRequest {
        var parameters = getDefaultOAuthParameters()
        parameters["grant_type"] = "client_credentials"
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint!, httpMethod: .POST, body: parameters)
    }
    static func requestAccessToken(withUsername username: String, andPassword password: String) -> URLRequest {
        var parameters = getDefaultOAuthParameters()
        parameters["grant_type"] = "password"
        parameters["username"] = username
        parameters["password"] = password
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint!, httpMethod: .POST, body: parameters, headers: nil)
    }
    static func requestAccessToken(withCode code: String) -> URLRequest {
        var parameters = getDefaultOAuthParameters()
        parameters["grant_type"] = "authorization_code"
        parameters["code"] = code
        parameters["redirect_uri"] = "/"
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint!, httpMethod: .POST, body: parameters, headers: nil)
    }
    static func refreshAccessToken(withRefreshToken refreshToken: String) -> URLRequest {
        var parameters = getDefaultOAuthParameters()
        parameters["grant_type"] = "refresh_token"
        parameters["refresh_token"] = refreshToken
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint!, httpMethod: .POST, body: parameters, headers: nil)
    }
}
