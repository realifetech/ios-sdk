//
//  CommunicateFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

enum CommunicateFactory {

    static func makeCommunicateModule() -> Communicate {
        let storage = CodableStorage(storage: UserDefaultsStorage(), storagePrefix: "apnToken")
        let pushNotificationRegistrar = PushNotificationRegistrar(tokenStore: storage)
        return CommunicateImplementing(pushNotificationRegistrar: pushNotificationRegistrar)
    }
}
