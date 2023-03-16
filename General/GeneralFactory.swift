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
        staticDeviceInformation: StaticDeviceInformation,
        reachabilityChecker: ReachabilityChecking,
        graphQLManager: GraphQLManageable
    ) -> General {
        let deviceRegistrationStore = CodableStore(
            storage: UserDefaultsStorage(),
            storagePrefix: "GeneralDeviceRegistration")
        let deviceRegistrationWorker = DeviceRegistrationWorker(
            appGroupStore: AppGroupUserDefaultsStore(appGroupId: staticDeviceInformation.appGroupId),
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker,
            deviceProvider: DeviceRepository(graphQLManager: graphQLManager),
            deviceRegistrationMaxAttempts: .max,
            retryRegistrationInterval: 10,
            store: deviceRegistrationStore)
        return GeneralImplementing(deviceRegistrationWorker: deviceRegistrationWorker)
    }
}
