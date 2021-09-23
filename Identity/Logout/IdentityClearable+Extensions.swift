//
//  IdentityClearable+Extensions.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 23/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import WebKit

public protocol URLCacheClearable {
    func removeAllCachedResponses()
    var diskCapacity: Int { get set }
    var memoryCapacity: Int { get set }
}

public protocol HTTPCookieStorable {
    func removeCookies(since date: Date)
}

public protocol WKWebDataStoreClearable {
    func fetchDataRecords(ofTypes dataTypes: Set<String>, completionHandler: @escaping ([WKWebsiteDataRecord]) -> Void)
    static func allWebsiteDataTypes() -> Set<String>
    func removeData(ofTypes dataTypes: Set<String>,
                    for dataRecords: [WKWebsiteDataRecord],
                    completionHandler: @escaping () -> Void)
}

extension URLCache: URLCacheClearable { }
extension HTTPCookieStorage: HTTPCookieStorable { }
extension WKWebsiteDataStore: WKWebDataStoreClearable { }
