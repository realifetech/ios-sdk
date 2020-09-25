//
//  DeviceRegistering.swift
//  General
//
//  Created by Olivier Butler on 25/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public protocol DeviceRegistering {
    var sdkReady: Bool { get }
    var deviceId: String { get }

    func registerDevice(_: (DeviceRegistrationResult) -> Void)
}

public enum DeviceRegistrationResult {
    case success
    case error(Error)
}
