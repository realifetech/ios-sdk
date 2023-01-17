//
//  AccessFactory.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

public struct AccessFactory {
    static func makeModule(graphQLManager: GraphQLManageable) -> Access {
        return AccessImplementing(graphQLManager: graphQLManager)
    }
}
