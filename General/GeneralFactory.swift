//
//  GeneralFactory.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine
import RealifeTech_CoreSDK

public enum GeneralFactory {

    public static func makeGeneralModule(
        staticDeviceInformation: StaticDeviceInformation,
        reachabilityChecker: ReachabilityChecking
    ) -> General {
        let deviceRegistrationStore = CodableStore(
            storage: UserDefaultsStorage(),
            storagePrefix: "GeneralDeviceRegistration")
        let deviceRegistrationWorker = DeviceRegistrationWorker(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker,
            deviceProvider: DeviceRepository.self,
            deviceRegistrationMaxAttempts: .max,
            store: deviceRegistrationStore)
        return GeneralImplementing(deviceRegistrationWorker: deviceRegistrationWorker)
    }
}
