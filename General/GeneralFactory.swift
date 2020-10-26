//
//  GeneralFactory.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

public enum GeneralFactory {
    public static func makeGeneralModule(
        deviceId: String,
        deviceModel: String,
        osVersion: String,
        sdkVersion: String,
        reachabilityChecker: ReachabilityChecking,
        deviceRegisteredSubject: CurrentValueSubject<Bool, Never>
    ) -> General {
        let deviceRegistrationLoopHandler = DeviceRegistrationLoopHandler(
            reachabilityChecker: reachabilityChecker,
            debounceRateSeconds: 10)
        let deviceRegistrationWorker = DeviceRegistrationWorker(
            deviceId: deviceId,
            deviceModel: deviceModel,
            osVersion: osVersion,
            sdkVersion: sdkVersion,
            reachabilityChecker: reachabilityChecker,
            loopHandler: deviceRegistrationLoopHandler,
            deviceRegisteredSubject: deviceRegisteredSubject)
        return GeneralImplementing(deviceRegistrationWorker: deviceRegistrationWorker)
    }
}
