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
    public let diskCache: DiskCachable

    public init(
        deviceHelper: UIDeviceInterface,
        reachabilityHelper: ReachabilityChecking,
        apiHelper: APITokenManagable,
        graphQLManager: GraphQLManageable,
        diskCache: DiskCachable
    ) {
        self.deviceHelper = deviceHelper
        self.reachabilityHelper = reachabilityHelper
        self.apiHelper = apiHelper
        self.graphQLManager = graphQLManager
        self.diskCache = diskCache
    }

    public func requestValidToken(completion: ((Result<Void, Error>) -> Void)?) {
        apiHelper.getValidToken(completion)
    }

    public func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) {
        apiHelper.storeCredentials(
            accessToken: accessToken,
            secondsExpiresIn: 20,
            refreshToken: refreshToken)
        graphQLManager.updateHeadersToNetworkTransport(deviceId: deviceHelper.deviceId, apiHelper: apiHelper)
    }

    public func clearStoredCredentials() {
        apiHelper.removeCredentials()
    }

    public func clearPrivateCachedData() {
        apiHelper.removeCredentials()
        diskCache.clearItems(deletionStrategy: .privateOnly, completion: nil)
    }

    public func clearOutdatedCachedData() {
        diskCache.clearItems(deletionStrategy: .outdatedOnly, completion: nil)
    }

    public func clearAllCachedData() {
        graphQLManager.clearAllCachedData(completion: nil)
    }
}
