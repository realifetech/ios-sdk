//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DeviceRegistrationWorker: DeviceRegistering {

    var sdkReady: Bool = false
    let deviceId: String

    private let deviceModel: String
    private let osVersion: String
    private let sdkVersion: String
    private let reachabilityChecker: ReachabilityChecking
    private let loopHandler: DeviceRegistrationLoopHandling

    var device: Device {
        Device(deviceId: deviceId,
               model: deviceModel,
               sdkVersion: sdkVersion,
               osVersion: osVersion,
               bluetoothOn: reachabilityChecker.isBluetoothConnected,
               wifiConnected: reachabilityChecker.isConnectedToWifi)
    }

    init(
        deviceId: String,
        deviceModel: String,
        osVersion: String,
        sdkVersion: String,
        reachabilityChecker: ReachabilityChecking,
        loopHandler: DeviceRegistrationLoopHandling
    ) {
        self.deviceId = deviceId
        self.deviceModel = deviceModel
        self.osVersion = osVersion
        self.sdkVersion = sdkVersion
        self.reachabilityChecker = reachabilityChecker
        self.loopHandler = loopHandler
    }

    func registerDevice(_ completion: @escaping () -> Void) {
        loopHandler.registerDevice(device) {
            self.sdkReady = true
            completion()
        }
    }
}
