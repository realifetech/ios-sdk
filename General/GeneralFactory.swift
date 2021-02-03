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
        reachabilityChecker: ReachabilityChecking,
        deviceRegisteredSubject: CurrentValueSubject<Bool, Never>
    ) -> General {
        let deviceRegistrationLoopHandler = DeviceRegistrationLoopHandler(
            reachabilityChecker: reachabilityChecker,
            debounceRateSeconds: 10)
        let deviceRegistrationStore = CodableStore(
            storage: UserDefaultsStorage(),
            storagePrefix: "GeneralDeviceRegistration")
        let deviceRegistrationWorker = DeviceRegistrationWorker(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker,
            loopHandler: deviceRegistrationLoopHandler,
            deviceRegisteredSubject: deviceRegisteredSubject,
            store: deviceRegistrationStore)
        return GeneralImplementing(deviceRegistrationWorker: deviceRegistrationWorker)
    }
}
