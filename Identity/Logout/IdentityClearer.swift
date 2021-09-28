//
//  IdentityClearer.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 23/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

final class IdentityClearer: IdentityClearing {
    var urlCache: URLCacheClearable
    var httpCookieStorage: HTTPCookieStorable
    var websiteDataStore: WKWebDataStoreClearable

    init(urlCache: URLCacheClearable,
         httpCookieStorage: HTTPCookieStorable,
         websiteDataStore: WKWebDataStoreClearable) {
        self.urlCache = urlCache
        self.httpCookieStorage = httpCookieStorage
        self.websiteDataStore = websiteDataStore
    }

    func clearIdentity(completion: (() -> Void)?) {
        urlCache.removeAllCachedResponses()
        urlCache.diskCapacity = 0
        urlCache.memoryCapacity = 0
        httpCookieStorage.removeCookies(since: Date.distantPast)
        let dataTypes = type(of: websiteDataStore).allWebsiteDataTypes()
        websiteDataStore.fetchDataRecords(ofTypes: dataTypes) { [weak self] records in
            records.enumerated().forEach { (index, record) in
                self?.websiteDataStore.removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                    if index == records.count - 1 {
                        completion?()
                    }
                })
            }
        }
    }
}
