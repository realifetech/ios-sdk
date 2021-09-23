//
//  IdentityFactory.swift
//  RealifeTech
//
//  Created by Ross Patman on 14/09/2021.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import WebKit

public enum IdentityFactory {

    static func makeIdentityModule(orderingJourneyViewUpdater: OrderingJourneyViewUpdating) -> Identity {
        let hostAppLoginRepository = HostAppLoginRepository()
        let hostAppLoginAuthenticator = HostAppAuthenticator(hostAppLoginDataProvider: hostAppLoginRepository,
                                                             orderingJourneyViewUpdater: orderingJourneyViewUpdater)
        // I've decided to include these web references in Identity, as they are global to logout systems, not just WOJ
        let identityClearer = IdentityClearer(urlCache: URLCache.shared,
                                              httpCookieStorage: HTTPCookieStorage.shared,
                                              websiteDataStore: WKWebsiteDataStore.default())
        return IdentityImplementing(hostAppAuthenticator: hostAppLoginAuthenticator, identityClearer: identityClearer)
    }
}
