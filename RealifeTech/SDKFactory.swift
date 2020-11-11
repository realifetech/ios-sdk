//
//  SDKFactory.swift
//  RealifeTech-SDK
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

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
        let deviceHelper = UIDeviceFactory.makeUIDeviceHelper()
        let reachabilityChecker = ReachabilityFactory.makeReachabilityHelper()
        let deviceRegisteredSubject = CurrentValueSubject<Bool, Never>(false)
        let deviceRegisteredValue = ReadOnlyCurrentValue(from: deviceRegisteredSubject)
        let apiHelper = APIV3RequesterHelper.setupV3API(
            deviceId: deviceHelper.deviceId,
            clientId: configuration.appCode,
            clientSecret: configuration.clientSecret,
            baseUrl: configuration.apiUrl)
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: deviceHelper.deviceId,
            deviceModel: deviceHelper.model,
            osVersion: deviceHelper.osVersion,
            sdkVersion: moduleVersionString)
        General = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: reachabilityChecker,
            deviceRegisteredSubject: deviceRegisteredSubject)
        let client = GraphNetwork(graphQLAPIUrl: configuration.graphApiUrl,
                                  tokenHelper: apiHelper,
                                  deviceId: deviceHelper.deviceId,
                                  reachabilityHelper: reachabilityChecker)
        let dispatcher = GraphQLDispatcher(client: client)
        Audiences = AudiencesImplementing(dispatcher: dispatcher)
        Analytics = AnalyticsFactory.makeAnalyticsModule(
            dispatcher: dispatcher,
            reachabilityHelper: reachabilityChecker,
            deviceRegisteredValue: deviceRegisteredValue)
        Communicate = CommunicateFactory.makeCommunicateModule()
        apiHelper.getValidToken {}
    }
}
