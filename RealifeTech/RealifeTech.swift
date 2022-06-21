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
    public static var CampaignAutomation: CampaignAutomation!
    public static var Identity: Identity!

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
        let apiHelper = createAPIHelper(with: configuration, deviceId: deviceHelper.deviceId)
        let graphQLManager = GraphQLFactory.makeGraphQLManager(
            deviceId: deviceHelper.deviceId,
            tokenHelper: apiHelper,
            graphQLAPIUrl: URL(string: configuration.graphQLApiUrl) ?? URL(fileURLWithPath: ""))
        Core = CoreImplementing(
            deviceHelper: deviceHelper,
            reachabilityHelper: reachabilityChecker,
            apiHelper: apiHelper,
            graphQLManager: graphQLManager,
            diskCache: DiskCache())
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString)
        General = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker)
        Audiences = AudiencesImplementing(graphQLManager: graphQLManager)
        let identityPersister = IdentityPersister(defaults: UserDefaults(suiteName: "RLT") ?? .standard)
        Analytics = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: graphQLManager,
            reachabilityHelper: reachabilityChecker,
            deviceRegistering: General,
            identityPersister: identityPersister)
        Communicate = CommunicateFactory.makeCommunicateModule(analytics: Analytics)
        Canvas = CanvasFactory.makeCanvasModule(graphQLManager: graphQLManager)
        Content = ContentFactory.makeContentModule(graphQLManager: graphQLManager)
        Sell = SellFactory.makeSellModule(
            graphQLManager: graphQLManager,
            orderingJourneyUrl: configuration.webOrderingJourneyUrl,
            colorStore: General)
        configureCampaignAutomation(deviceId: deviceHelper.deviceId,
                                    tokenHelper: apiHelper,
                                    graphQLAPIUrl: configuration.graphQLApiUrl)
        Identity = IdentityFactory.makeModule(analyticsLogger: Analytics,
                                              identityPersister: identityPersister)
    }

    private static func createAPIHelper(with configuration: SDKConfiguration, deviceId: String) -> APITokenManagable {
        return APIRequesterHelper.setupAPI(
            deviceId: deviceId,
            clientId: configuration.appCode,
            clientSecret: configuration.clientSecret,
            baseUrl: configuration.apiUrl,
            notificationCenter: NotificationCenter.default)
    }

    private static func configureCampaignAutomation(deviceId: String,
                                                    tokenHelper: APITokenManagable,
                                                    graphQLAPIUrl: String) {
        let caGraphQLManager = GraphQLFactory.makeGraphQLManager(
            deviceId: deviceId,
            tokenHelper: tokenHelper,
            graphQLAPIUrl: URL(string: "\(graphQLAPIUrl)/ca/graphql") ?? URL(fileURLWithPath: ""))
        CampaignAutomation = CampaignAutomationFactory.makeModule(graphQLManager: caGraphQLManager,
                                                                  analyticsLogger: Analytics)
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
        CampaignAutomation = nil
        Identity = nil
    }

    /// Override the webOrderingJourneyUrl
    /// - Parameter webOrderingJourneyUrl: New URL with the string type
    public static func set(webOrderingJourneyUrl: String) {
        Sell.orderingJourneyUrl = webOrderingJourneyUrl
    }
}
