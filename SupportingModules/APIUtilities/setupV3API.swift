//
//  setupV3API.swift
//  APIUtilities
//
//  Created by Olivier Butler on 05/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

/// Configures the V3 API Requesters by creating a header variables manager. The manager is returned so other API modules can use the V3 headers.
/// - Parameter deviceID: An id unique to the specific physical device. Usually a 40 charachter UUID string.
/// - Parameter clientID: The id used by the client e.g. "LS_0"
/// - Parameter clientSecret: Code used to initially authenticate with our backend.
/// - Parameter baseUrl: The API root which should be used for all queries, e.g. "http://api.website.com/production"
public func setupV3API(deviceID: String, clientID: String, clientSecret: String, baseUrl: String) -> ApiHeaderVariableHolding {
    // First setup any static properties
    OAuthRequester.setDefaultOAuthParameters(clientId: clientID, clientSecret: clientSecret)
    RequestBaseURL.baseURLV3 = baseUrl

    // Then build the API Variables Store
    let authorisationStore = AuthorisationStore()
    let authorisationWorker = AuthorisationWorker(authorisationStore: authorisationStore)
    let oAuthTokenRefreshWatcher = OAuthTokenRefreshWatcher()
    let oAuthRefreshOrWaitActionGenerator = OAuthRefreshOrWaitActionGenerator(
        authorisationWorker: authorisationWorker,
        oAuthTokenRefreshWatcher: oAuthTokenRefreshWatcher,
        authorisationStore: authorisationStore)
    let apiVariables = ApiHeaderVariables(
        deviceID: deviceID,
        authorisationStore: authorisationStore,
        oAuthRefreshOrWaitActionGenerator: oAuthRefreshOrWaitActionGenerator)

    // Finally expose the variables store and return it for use with other API modules.
    ApiHeaderVariables.sharedInstance = apiVariables
    return apiVariables
}
