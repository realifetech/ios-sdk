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
    ) -> GeneralImplementing {
        let registrationWorker = DeviceRegistrationWorker(
            reachabilityChecker: reachabilityChecker)
        return GeneralImplementing(
            deviceId: deviceId,
            reachabilityChecker: reachabilityChecker,
            deviceRegistrationWorker: registrationWorker)
    }
}
