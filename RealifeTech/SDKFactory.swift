//
//  SDKFactory.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class RealifeTech {

    public static var General: General!
    public static var Audiences: AudienceChecking!
    public static var Analytics: Analytics!
    public static var Communicate: Communicate!

    private static var moduleVersionString: String {
        Bundle(for: self.self).infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
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
            baseUrl: configuration.apiUrl)
        General = GeneralFactory.makeGeneralModule(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString,
            reachabilityChecker: reachabilityChecker)
        let client = GraphNetwork(graphQLAPIUrl: configuration.graphApiUrl,
                                  tokenHelper: apiHelper,
                                  deviceId: deviceHelper.deviceId,
                                  reachabilityHelper: reachabilityChecker)
        let dispatcher = GraphQLDispatcher(client: client)
        Audiences = AudiencesImplementing(dispatcher: dispatcher)
        Analytics = AnalyticsFactory.makeAnalyticsModule(dispatcher: dispatcher,
                                                         reachabilityHelper: reachabilityChecker)
        Communicate = CommunicateFactory.makeCommunicateModule()
        apiHelper.getValidToken {}
    }
}
