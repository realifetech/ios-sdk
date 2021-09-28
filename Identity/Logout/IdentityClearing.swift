//
//  IdentityClearing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 23/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol IdentityClearing {
    var urlCache: URLCacheClearable { get }
    var httpCookieStorage: HTTPCookieStorable { get }
    var websiteDataStore: WKWebDataStoreClearable { get }
    func clearIdentity(completion: (() -> Void)?)
}
