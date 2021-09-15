//
//  RealifeTech.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class RealifeTech {

    public static var Core: Core!
    public static var General: General!
    public static var Audiences: AudienceChecking!
    public static var Analytics: Analytics!
    public static var Communicate: Communicate!
    public static var Canvas: Canvas!
    public static var Content: Content!
    public static var Sell: Sell!

    private static var moduleVersionString: String {
        Bundle(for: self.self).infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }

    /// Provides information required for the SDK to operate.
    /// This MUST be called before any other SDK functionality is acessed.
    /// Calling this function more than once will have no effect.
    /// - Parameters
    ///   - configuration: Struct containing the desired SDK configuration
    public static func configureSDK(with configuration: SDKConfiguration) {
        let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let reachabilityChecker = ReachabilityFactory.makeReachabilityHelper()
        let apiHelper = APIRequesterHelper.setupAPI(
            deviceId: deviceHelper.deviceId,
            clientId: configuration.appCode,
            clientSecret: configuration.clientSecret,
            baseUrl: configuration.apiUrl)
        let graphQLManager = GraphQLFactory.makeGraphQLManager(
            deviceId: deviceHelper.deviceId,
            tokenHelper: apiHelper,
            graphQLAPIUrl: URL(string: configuration.graphQLApiUrl) ?? URL(fileURLWithPath: ""))
        Core = CoreImplementing(
            deviceHelper: deviceHelper,
            reachabilityHelper: reachabilityChecker,
            apiHelper: apiHelper,
            graphQLManager: GraphQLManager.shared,
            diskCache: DiskCache())
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString)
        General = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker)
        Audiences = AudiencesImplementing(graphQLManager: GraphQLManager.shared)
        Analytics = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: graphQLManager,
            reachabilityHelper: reachabilityChecker,
            deviceRegistering: General)
        Communicate = CommunicateFactory.makeCommunicateModule()
        Canvas = CanvasFactory.makeCanvasModule(graphQLManager: GraphQLManager.shared)
        Content = ContentFactory.makeContentModule(graphQLManager: GraphQLManager.shared)
        Sell = SellFactory.makeSellModule(
            graphQLManager: GraphQLManager.shared,
            orderingJourneyUrl: configuration.webOrderingJourneyUrl,
            colorStore: General)
    }

    public static func clearAllInterfaces() {
        Core = nil
        General = nil
        Audiences = nil
        Analytics = nil
        Communicate = nil
        Canvas = nil
        Content = nil
        Sell = nil
    }

    /// Override the webOrderingJourneyUrl
    /// - Parameter webOrderingJourneyUrl: New URL with the string type
    public static func set(webOrderingJourneyUrl: String) {
        Sell.orderingJourneyUrl = webOrderingJourneyUrl
    }
}
