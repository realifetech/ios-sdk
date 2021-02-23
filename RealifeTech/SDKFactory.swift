//
//  SDKFactory.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech_CoreSDK

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
        let deviceHelper = CoreFactory.makeDeviceHelper()
        let reachabilityChecker = CoreFactory.makeReachablitiyChecker()
        let coreSDKConfiguration = CoreSDKConfiguration(
            appCode: configuration.appCode,
            clientSecret: configuration.clientSecret,
            apiUrl: configuration.apiUrl,
            graphQLApiUrl: configuration.graphQLApiUrlString)
        let apiHelper = CoreFactory.makeApiHelper(deviceId: deviceHelper.deviceId, configuration: coreSDKConfiguration)
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString)
        General = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker)
        let dispatcher = CoreFactory.makeGraphQLDispatcher(
            configuration: coreSDKConfiguration,
            tokenHelper: apiHelper,
            deviceId: deviceHelper.deviceId,
            reachabilityHelper: reachabilityChecker)
        Audiences = AudiencesImplementing(dispatcher: dispatcher)
        if let dispatcher = dispatcher as? GraphQLDispatcher {
            Analytics = AnalyticsFactory.makeAnalyticsModule(
                dispatcher: dispatcher,
                reachabilityHelper: reachabilityChecker,
                deviceRegistering: General)
        }
        Communicate = CommunicateFactory.makeCommunicateModule()
        CoreFactory.requestValidToken(fromApiHelper: apiHelper) { }
    }
}
