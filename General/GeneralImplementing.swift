//
//  GeneralImplementing.swift
//  General
//
//  Created by Olivier Butler on 23/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public class GeneralImplementing: DeviceRegistering, SDKConfigurable {
    public init() {}

    public var sdkReady: Bool {
        print("someone asked if the SDK was ready")
        return false
    }

    public var deviceId: String {
        print("someone asked for the device ID")
        return "x"
    }

    public func registerDevice(_: (DeviceRegistrationResult) -> ()) {
        print("Someone wanted to register the device")
    }

    public func setConfiguration(_: SDKConfiguration) {
        print("Someone wanted to set the SDK Configuration")
    }
}


public protocol DeviceRegistering {
    var sdkReady:Bool { get }
    var deviceId: String { get }

    func registerDevice(_: (DeviceRegistrationResult) -> ()) -> ()
}

public protocol SDKConfigurable {
    func setConfiguration(_: SDKConfiguration) -> ()
}

public protocol SDKConfiguration {
    var appCode: String { get }
    var clientSecret: String { get }
    var apiUrl: String? { get }
    var graphApiUrl: String? { get }
}

public enum DeviceRegistrationResult {
    case success
    case error(Error)
}
