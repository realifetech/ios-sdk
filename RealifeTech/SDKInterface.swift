//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class RealifeTech {

    public static var General: General!
    public static var Audiences: AudienceChecking!
    public static var Analytics: AnalyticsImplementing!
    public static var Communicate: CommunicateImplementing!

    private static var moduleVersionString: String? {
        Bundle(for: self.self).infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        print("Someone called to configure the SDK")
        let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let reachabilityChecker = ReachabilityFactory.makeReachabilityHelper()
        let apiHelper = APIV3RequesterHelper.setupV3API(
            deviceId: deviceHelper.deviceId,
            clientId: configuration.appCode,
            clientSecret: configuration.clientSecret,
            baseUrl: configuration.apiUrl ?? "")
        General = GeneralFactory.makeGeneralModule(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString ?? "123", // TODO: Fix this
            reachabilityChecker: reachabilityChecker)
        if let apiUrl = configuration.graphApiUrl, let graphQlUrl = URL(string: apiUrl) {
            let client = GraphNetwork(graphQLAPIUrl: graphQlUrl,
                                      tokenHelper: apiHelper,
                                      deviceId: deviceHelper.deviceId,
                                      reachabilityHelper: ReachabilityFactory.makeReachabilityHelper())
            let dispatcher = GraphQLDispatcher(client: client)
            Audiences = AudiencesImplementing(dispatcher: dispatcher)
            Analytics = AnalyticsImplementing(dispatcher: dispatcher)
        }
        Communicate = CommunicateImplementing()
        apiHelper.getValidToken {}
    }
}
