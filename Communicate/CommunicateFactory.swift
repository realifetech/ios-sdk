//
//  CommunicateFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech_CoreSDK

enum CommunicateFactory {

    static func makeCommunicateModule() -> Communicate {
        let storage = CodableStore(storage: UserDefaultsStorage(), storagePrefix: "apnToken")
        let pushNotificationRegistrar = PushNotificationRegistrar(
            scheduler: nil,
            tokenStore: storage)
        return CommunicateImplementing(pushNotificationRegistrar: pushNotificationRegistrar)
    }
}
