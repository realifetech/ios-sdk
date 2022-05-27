//
//  RequesterURLSessionProvider.swift
//  RealifeTech
//
//  Created by Aleksandrs Proskurins on 26/05/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

public class RequesterURLSessionProvider {

    var session: URLSession {
        URLSession.shared
    }

    var sessionCache: URLCache {
        URLCache.shared
    }

    public init() {}
}
