//
//  ReachabilityChecker.swift
//  ReachabilityChecker
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import CoreBluetooth

class ReachabilityChecker: NSObject {

    private var bluetoothEnabled: Bool = false
    private var bluetoothManager: CBCentralManager
    private var networkConnectivityChecker: NetworkConnectivityChecker

    init(
        bluetoothManager: CBCentralManager = CBCentralManager(delegate: nil,
                                                              queue: nil,
                                                              options: [CBCentralManagerOptionShowPowerAlertKey: 0]),
        networkConnectivityChecker: NetworkConnectivityChecker = NetworkConnectivityChecker()
    ) {
        self.bluetoothManager = bluetoothManager
        self.networkConnectivityChecker = networkConnectivityChecker
        super.init()
        self.bluetoothManager.delegate = self
    }
}

extension ReachabilityChecker: ReachabilityChecking {

    public var isBluetoothConnected: Bool {
        return bluetoothEnabled
    }

    public var isConnectedToWifi: Bool {
        return networkConnectivityChecker.wifiConnected
    }

    public var hasNetworkConnection: Bool {
        return networkConnectivityChecker.hasNetworkConnection
    }
}

extension ReachabilityChecker: CBCentralManagerDelegate {

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bluetoothEnabled = central.state == .poweredOn
    }
}
