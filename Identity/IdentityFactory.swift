//
//  IdentityFactory.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct IdentityFactory {
    static func makeModule(
        analyticsLogger: Analytics,
        identityPersister: IdentityPersisting,
        graphQLManager: GraphQLManageable
    ) -> Identity {
        return IdentityImplementing(analyticsLogger: analyticsLogger,
                                    identityPersister: identityPersister,
                                    sso: SSORepository(graphQLManager: graphQLManager))
    }
}
