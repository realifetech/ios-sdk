//
//  RealifeTech.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import UIKit

public class RealifeTech {

    public static var Core: Core!
    public static var General: General!
    public static var Audiences: AudienceChecking!
    public static var Analytics: Analytics!
    public static var Communicate: Communicate!
    public static var Canvas: Canvas!
    public static var Content: Content!
    public static var Sell: Sell!
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
        Analytics = AnalyticsFactory.makeAnalyticsModule(
            graphQLManager: graphQLManager,
            reachabilityHelper: reachabilityChecker,
            deviceRegistering: General)
        Communicate = CommunicateFactory.makeCommunicateModule()
        Canvas = CanvasFactory.makeCanvasModule(graphQLManager: graphQLManager)
        Content = ContentFactory.makeContentModule(graphQLManager: graphQLManager)
        Sell = SellFactory.makeSellModule(
            graphQLManager: graphQLManager,
            orderingJourneyUrl: configuration.webOrderingJourneyUrl,
            colorStore: General,
            applicationURLOpener: UIApplication.shared)
        Identity = IdentityFactory.makeIdentityModule(graphQLManager: graphQLManager,
                                                      orderingJourneyViewUpdater: Sell.orderingJourneyViewUpdater)
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
        Identity = nil
    }

    /// Override the webOrderingJourneyUrl
    /// - Parameter webOrderingJourneyUrl: New URL with the string type
    public static func set(webOrderingJourneyUrl: String) {
        Sell.orderingJourneyUrl = webOrderingJourneyUrl
    }
}
