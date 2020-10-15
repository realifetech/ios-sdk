//
//  GeneralFactory.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import ReachabilityChecker

public enum GeneralFactory {
    public static func makeGeneralModule(
        deviceId: String,
        reachabilityChecker: ReachabilityChecking
    ) -> General {
        let registrationWorker = DeviceRegistrationWorker(
            reachabilityChecker: reachabilityChecker,
            debounceRateSeconds: 10)
        return GeneralImplementing(
            deviceId: deviceId,
            reachabilityChecker: reachabilityChecker,
            deviceRegistrationWorker: registrationWorker)
    }
}
