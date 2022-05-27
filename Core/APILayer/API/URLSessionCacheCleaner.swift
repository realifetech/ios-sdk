//
//  URLSessionCleaner.swift
//  RealifeTech
//
//  Created by Aleksandrs Proskurins on 27/05/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

public class URLSessionCacheCleaner {

    private let sessionProvider: RequesterURLSessionProvider

    public init(sessionProvider: RequesterURLSessionProvider = RequesterURLSessionProvider()) {
        self.sessionProvider = sessionProvider
    }

    func removeAllCachedData() {
        sessionProvider.sessionCache.removeAllCachedResponses()
    }
}
