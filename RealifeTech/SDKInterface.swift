//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import General
import Audiences
import Analytics
import APIV3Utilities
import UIDeviceHelper
import GraphQL
import Foundation
import ReachabilityChecker

public class RealifeTech {

    public static var General: GeneralImplementing!
    public static var Audiences: AudienceChecking!
    public static var Analytics: AnalyticsImplementing!

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
            baseUrl: "http://api-dev.livestyled.com/v3")
        General = GeneralImplementing()
        if let apiUrl = configuration.graphApiUrl, let graphQlUrl = URL(string: apiUrl) {
            let client = GraphNetwork(graphQLAPIUrl: graphQlUrl,
                                      tokenHelper: helper,
                                      deviceId: deviceHelper.deviceId,
                                      reachabilityHelper: ReachabilityFactory.makeReachabilityHelper())
            let dispatcher: GraphQLDispatching = GraphQLDispatcher(client: client)
            Audiences = AudiencesImplementing(tokenHelper: helper,
                                              graphQLAPIUrl: configuration.graphApiUrl ?? "",
                                              deviceId: deviceHelper.deviceId)
            Analytics = AnalyticsImplementing(dispatcher: dispatcher)
        }
    }
}
