//
//  CoreFactory.swift
//  RealifeTech-CoreSDK
//
//  Created by Mickey Lee on 10/12/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol Core {
    var reachabilityHelper: ReachabilityChecking { get }

    func requestValidToken(completion: ((Result<Void, Error>) -> Void)?)
    func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?)
    func clearStoredCredentials()
    func clearPrivateCachedData()
    func clearOutdatedCachedData()
    func clearAllCachedData()
    func clearAllNetworkCachedData()
}
