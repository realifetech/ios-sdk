//
//  IdentityFactory.swift
//  RealifeTech
//
//  Created by Ross Patman on 14/09/2021.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public enum IdentityFactory {

    static func makeIdentityModule() -> Identity {
        let hostAppLoginRepository = HostAppLoginRepository()
        let hostAppLoginAuthenticator = HostAppAuthenticator(hostAppLoginDataProvider: hostAppLoginRepository)
        return IdentityImplementing(hostAppAuthenticator: hostAppLoginAuthenticator)
    }
}
