//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class RealifeTech {

    public static var General: GeneralImplementing!
    public static var Audiences: AudienceChecking!
    public static var Communicate: CommunicateImplementing!

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        print("Someone called to configure the SDK")
        let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let helper = APIV3RequesterHelper.setupV3API(
            deviceId: deviceHelper.deviceId,
            clientId: "LS_0",
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C",
            baseUrl: "http://api-staging.livestyled.com/v3")
        General = GeneralImplementing()
        Audiences = AudiencesImplementing(tokenHelper: helper,
                                          graphQLAPIUrl: configuration.graphApiUrl ?? "",
                                          deviceId: deviceHelper.deviceId)
        Communicate = CommunicateImplementing()
        helper.getValidToken {}
    }
}
