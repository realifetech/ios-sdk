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

// Start
// - If already waiting, return an obsevable of the current wait logic
// - Otherwise, start a 10s countdown
// - Start a registration call
// - On success, clear the timer, send completion to all the observers
// - On failure, register a retry at the end of the timer

// TODO Tomorrow
// - The worker should check for an ongoing refresh
// -- It should append the current completion handler to it if there is one
// - It should check the reachability status (it will need the helper passed in)
// -- Start a timer (make one) on the worker
// -- If good, it should execute the call
// -- If good, it should set the watcher to be valid, completing all those waiting
// - If any kind of failure, *somehow* setup a retry callback which will execute at the end of the 10s.
