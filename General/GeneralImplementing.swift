//
//  GeneralImplementing.swift
//  General
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class GeneralImplementing: General {

    private let deviceRegistrationWorker: DeviceRegistering

    init(deviceRegistrationWorker: DeviceRegistering) {
        self.deviceRegistrationWorker = deviceRegistrationWorker
    }
}

// MARK: - Device Registration
extension GeneralImplementing {

    public var sdkReady: Bool { deviceRegistrationWorker.sdkReady }
    public var deviceId: String { deviceRegistrationWorker.deviceId }

    public func registerDevice(_ completion: @escaping() -> Void) {
        deviceRegistrationWorker.registerDevice(completion)
    }
}
