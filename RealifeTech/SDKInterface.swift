//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import General
import Communicate
import APIV3Utilities
import UIDeviceHelper
import ReachabilityChecker
import Foundation

public class RealifeTech {

    public static var General: GeneralImplementing!
    public static var Communicate: CommunicateImplementing!

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        print("Someone called to configure the SDK")
        let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let reachabilityChecker = ReachabilityFactory.makeReachabilityHelper()
        let helper = APIV3RequesterHelper.setupV3API(
            deviceID: deviceHelper.deviceId,
            clientID: "LS_0",
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C",
            baseUrl: "http://api-staging.livestyled.com/v3")
        General = GeneralFactory.makeGeneralModule(
            deviceId: deviceHelper.deviceId,
            reachabilityChecker: reachabilityChecker)
        Communicate = CommunicateImplementing()
        helper.getValidToken {}
    }
}
