//
//  APIV3RequesterHelper.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import APILayer

struct APIV3RequesterHelper {

    static var tokenManager: V3APITokenManagable = EmptyTokenManager()
    static var deviceId: String = ""
    static var v3baseUrl: RequestRootURL = APIRoot(rawValue: "")

    /// Configures the V3 API Requesters by creating a header variables manager. The manager is returned so other API modules can use the V3 headers.
    /// - Parameter deviceID: An id unique to the specific physical device. Usually a 40 charachter UUID string.
    /// - Parameter clientID: The id used by the client e.g. "LS_0"
    /// - Parameter clientSecret: Code used to initially authenticate with our backend.
    /// - Parameter baseUrl: The API root which should be used for all queries, e.g. "http://api.website.com/production"
    public static func setupV3API(deviceID: String, clientID: String, clientSecret: String, baseUrl: String) -> V3APITokenManagable {
        // First setup any static properties
        OAuthRequester.setDefaultOAuthParameters(clientId: clientID, clientSecret: clientSecret)
        v3baseUrl = APIRoot(rawValue: baseUrl)
        deviceId = deviceID
        // Then make and return a token manager
        let v3ApiTokenManager = constructTokenManager()
        tokenManager = v3ApiTokenManager
        return v3ApiTokenManager
    }

    private static func constructTokenManager() -> V3APITokenManagable {
        let authorisationStore = AuthorisationStore()
        let authorisationWorker = AuthorisationWorker(authorisationStore: authorisationStore)
        let oAuthTokenRefreshWatcher = OAuthTokenRefreshWatcher()
        let oAuthRefreshOrWaitActionGenerator = OAuthRefreshOrWaitActionGenerator(
            authorisationWorker: authorisationWorker,
            oAuthTokenRefreshWatcher: oAuthTokenRefreshWatcher,
            authorisationStore: authorisationStore)
        return V3APITokenManager(
            authorisationStore: authorisationStore,
            oAuthRefreshOrWaitActionGenerator: oAuthRefreshOrWaitActionGenerator)
    }
}
