//
//  RealifeTech.swift
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
    public static var Content: Content!
    public static var Sell: Sell!

    private static var graphQLManager: GraphQLManageable!

    private static var moduleVersionString: String {
        Bundle(for: self.self).infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameter configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: CoreConfiguration) {
        let deviceHelper = CoreFactory.makeDeviceHelper()
        let reachabilityChecker = CoreFactory.makeReachablitiyChecker()
        let apiHelper = CoreFactory.makeApiHelper(deviceId: deviceHelper.deviceId, configuration: configuration)
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString)
        General = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker)
        graphQLManager = CoreFactory.makeGraphQLManager(
            configuration: configuration,
            tokenHelper: apiHelper,
            deviceId: deviceHelper.deviceId)
        Audiences = AudiencesImplementing(graphQLManager: graphQLManager)
        Analytics = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: graphQLManager,
            reachabilityHelper: reachabilityChecker,
            deviceRegistering: General)
        Communicate = CommunicateFactory.makeCommunicateModule()
        Content = ContentFactory.makeContentModule(graphQLManager: graphQLManager)
        Sell = SellFactory.makeSellModule(graphQLManager: graphQLManager)
    }

    /// Clear the persistent response for all GraphQL queries and mutations
    public static func clearAllCachedData() {
        graphQLManager.clearAllCachedData()
    }
}
