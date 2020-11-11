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
    var deviceId: String { staticDeviceInformation.deviceId }

    private let staticDeviceInformation: StaticDeviceInformation
    private let reachabilityChecker: ReachabilityChecking
    private let loopHandler: DeviceRegistrationLoopHandling
    private let deviceRegisteredSubject: CurrentValueSubject<Bool, Never>
    private let store: CodableStorageProtocol
    private let storeKey = "DeviceRegistrationState"

    var device: Device {
        Device(deviceId: staticDeviceInformation.deviceId,
               model: staticDeviceInformation.deviceModel,
               sdkVersion: "SDK_" + staticDeviceInformation.sdkVersion,
               osVersion: staticDeviceInformation.osVersion,
               bluetoothOn: reachabilityChecker.isBluetoothConnected,
               wifiConnected: reachabilityChecker.isConnectedToWifi)
    }

    init(
        staticDeviceInformation: StaticDeviceInformation,
        reachabilityChecker: ReachabilityChecking,
        loopHandler: DeviceRegistrationLoopHandling,
        deviceRegisteredSubject: CurrentValueSubject<Bool, Never>,
        store: CodableStorageProtocol
    ) {
        self.staticDeviceInformation = staticDeviceInformation
        self.reachabilityChecker = reachabilityChecker
        self.loopHandler = loopHandler
        self.deviceRegisteredSubject = deviceRegisteredSubject
        self.store = store
        deviceRegisteredSubject.send(getStoredRegistrationValue())
    }

    func getStoredRegistrationValue() -> Bool {
        guard let storedState: Bool = try? store.fetch(for: storeKey) else {
            return false
        }
        return storedState
    }

    func registerDevice(_ completion: @escaping () -> Void) {
        loopHandler.registerDevice(device) {
            if !self.deviceRegisteredSubject.value {
                try? self.store.save(true, for: self.storeKey)
                self.deviceRegisteredSubject.send(true)
            }
            completion()
        }
    }
}
