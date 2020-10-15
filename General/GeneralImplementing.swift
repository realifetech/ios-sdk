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

public class GeneralImplementing: DeviceRegistering {

    public var sdkReady: Bool

    public let deviceId: String
    private let reachabilityChecker: ReachabilityChecking
    private let deviceRegistrationWorker: DeviceRegistrationWorkerProtocol

    init(
        deviceId: String,
        reachabilityChecker: ReachabilityChecking,
        deviceRegistrationWorker: DeviceRegistrationWorkerProtocol
    ) {
        self.deviceId = deviceId
        self.reachabilityChecker = reachabilityChecker
        self.deviceRegistrationWorker = deviceRegistrationWorker
        self.sdkReady = false
    }

    public func registerDevice(_ completion: @escaping(Result<Void, Error>) -> Void) {
        let device = Device(deviceId: deviceId,
                            model: "OlivierPhone",
                            sdkVersion: "0.0.1alpha",
                            osVersion: "4",
                            bluetoothOn: reachabilityChecker.isBluetoothConnected,
                            wifiConnected: reachabilityChecker.isConnectedToWifi)
        deviceRegistrationWorker.registerDevice(device) { result in
            switch result {
            case .success:
                self.sdkReady = true
            default: break
            }
        }
    }
}
