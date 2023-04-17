//
//  CommunicateFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

enum CommunicateFactory {

    static func makeCommunicateModule(analytics: Analytics, graphQLManager: GraphQLManageable) -> Communicate {
        let storage = CodableStore(storage: UserDefaultsStorage(), storagePrefix: "apnToken")
        let pushNotificationRegistrar = PushNotificationRegistrar(
            tokenStore: storage,
            deviceRepository: DeviceRepository.self)
        return CommunicateImplementing(
            pushNotificationRegistrar: pushNotificationRegistrar,
            analytics: analytics,
            graphQLManager: graphQLManager)
    }
}
