//
//  GeneralImplementing.swift
//  General
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import APIUtilities

public class GeneralImplementing: DeviceRegistering, SDKConfigurable {
    public init() {}

    public var sdkReady: Bool {
        print("someone asked if the SDK was ready")
        return true
    }

    public var deviceId: String {
        print("someone asked for the device ID")
        return "x"
    }

    public func registerDevice(_: (DeviceRegistrationResult) -> Void) {
        print("Someone wanted to register the device")
        testMethod()
    }

    public func setConfiguration(_: SDKConfiguration) {
        print("Someone wanted to set the SDK Configuration")
    }
}
