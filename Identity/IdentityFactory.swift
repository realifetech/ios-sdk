//
//  IdentityFactory.swift
//  RealifeTech
//
//  Created by Ross Patman on 14/09/2021.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public enum IdentityFactory {

    static func makeIdentityModule(orderingJourneyViewUpdater: OrderingJourneyViewUpdating) -> Identity {
        let hostAppLoginRepository = HostAppLoginRepository()
        let hostAppLoginAuthenticator = HostAppAuthenticator(hostAppLoginDataProvider: hostAppLoginRepository,
                                                             orderingJourneyViewUpdater: orderingJourneyViewUpdater)
        return IdentityImplementing(hostAppAuthenticator: hostAppLoginAuthenticator)
    }
}
