//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine
import RxSwift
import RxCocoa

class DeviceRegistrationWorker: DeviceRegistering {

    var sdkReady: Bool { deviceRegisteredSubject.value }
    let deviceId: String

    private let deviceModel: String
    private let osVersion: String
    private let sdkVersion: String
    private let reachabilityChecker: ReachabilityChecking
    private let loopHandler: DeviceRegistrationLoopHandling
    private let deviceRegisteredSubject: CurrentValueSubject<Bool, Never>

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
        loopHandler: DeviceRegistrationLoopHandling,
        deviceRegisteredSubject: CurrentValueSubject<Bool, Never>
    ) {
        self.deviceId = deviceId
        self.deviceModel = deviceModel
        self.osVersion = osVersion
        self.sdkVersion = sdkVersion
        self.reachabilityChecker = reachabilityChecker
        self.loopHandler = loopHandler
        self.deviceRegisteredSubject = deviceRegisteredSubject
    }

    func registerDevice(_ completion: @escaping () -> Void) {
        loopHandler.registerDevice(device) {
            self.deviceRegisteredSubject.send(true)
            completion()
        }
    }
}
