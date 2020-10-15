//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import General
import APIV3Utilities
import UIDeviceHelper
import Foundation

public class RealifeTech {

    public static var General: GeneralImplementing!

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        print("Someone called to configure the SDK")
        //let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let helper = APIV3RequesterHelper.setupV3API(
            deviceId: UUID().uuidString,
            clientId: "LS_0",
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C",
            baseUrl: "http://api-dev.livestyled.com/v3")
        General = GeneralImplementing()
        helper.getValidToken {}
    }
}
