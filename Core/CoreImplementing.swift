//
//  CoreImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class CoreImplementing: Core {

    public let deviceHelper: UIDeviceInterface
    public let reachabilityHelper: ReachabilityChecking
    public let apiHelper: APITokenManagable
    public let graphQLManager: GraphQLManageable

    public init(
        deviceHelper: UIDeviceInterface,
        reachabilityHelper: ReachabilityChecking,
        apiHelper: APITokenManagable,
        graphQLManager: GraphQLManageable
    ) {
        self.deviceHelper = deviceHelper
        self.reachabilityHelper = reachabilityHelper
        self.apiHelper = apiHelper
        self.graphQLManager = graphQLManager
    }

    public func requestValidToken(completion: ((Result<Void, Error>) -> Void)?) {
        apiHelper.getValidToken(completion)
    }

    public func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) {
        apiHelper.storeCredentials(
            accessToken: accessToken,
            secondsExpiresIn: secondsExpiresIn,
            refreshToken: refreshToken)
    }

    public func clearStoredCredentials() {
        apiHelper.removeCredentials()
    }

    public func clearAllCachedData() {
        graphQLManager.clearAllCachedData()
    }
}
