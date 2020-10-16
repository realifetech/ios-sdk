//
//  GeneralImplementing.swift
//  General
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Repositories
import ReachabilityChecker
import RxSwift
import RxCocoa

class GeneralImplementing: General {

    // TODO: fix this
    let SDKVERSION = "0.0.1alpha"

    public let deviceId: String
    private let deviceModel: String
    private let osVersion: String
    private let reachabilityChecker: ReachabilityChecking
    private let deviceRegistrationWorker: DeviceRegistrationWorkerProtocol

    init(
        deviceId: String,
        deviceModel: String,
        osVersion: String,
        reachabilityChecker: ReachabilityChecking,
        deviceRegistrationWorker: DeviceRegistrationWorkerProtocol
    ) {
        self.deviceId = deviceId
        self.deviceModel = deviceModel
        self.osVersion = osVersion
        self.reachabilityChecker = reachabilityChecker
        self.deviceRegistrationWorker = deviceRegistrationWorker
    }
}

// MARK:-  Device Registration
extension GeneralImplementing {

    public var sdkReady: Bool { deviceRegistrationWorker.hasRegistered }

    var device: Device {
        Device(deviceId: deviceId,
               model: deviceModel,
               sdkVersion: SDKVERSION,
               osVersion: osVersion,
               bluetoothOn: reachabilityChecker.isBluetoothConnected,
               wifiConnected: reachabilityChecker.isConnectedToWifi)
    }

    public func registerDevice(_ completion: @escaping(Result<Void, Error>) -> Void) {
        deviceRegistrationWorker.registerDevice(device, completion)
    }
}
