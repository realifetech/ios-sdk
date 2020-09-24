//
//  SDKInterface.swift
//  RealifeTech-SDK
//
//  Created by Olivier Butler on 23/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import General
import Foundation

public class RealifeTech {
    static var injectedGeneralModule: GeneralImplementing? // So we can test. Could also use method swizzling.

    public static var General: GeneralImplementing!
    public static var Communicate: CommunicateInterface!

    public static func configureSDK(with configuration: SDKConfiguration) {
        let generalModule = injectedGeneralModule ?? GeneralImplementing()
        generalModule.setConfiguration(configuration)
        General = generalModule
        Communicate = CommunicateInterface()
    }
}

public struct CommunicateInterface {
    let registeredForPush: Bool = false
}

public struct SDKConfiguration: General.SDKConfiguration {
    public var appCode: String
    public var clientSecret: String
    public var apiUrl: String?
    public var graphApiUrl: String?
}
