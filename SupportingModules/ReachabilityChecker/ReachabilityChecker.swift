//
//  ReachabilityChecker.swift
//  ReachabilityChecker
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import CoreBluetooth

public class ReachabilityChecker: NSObject {

    private var bluetoothEnabled: Bool = false
    private var bluetoothManager: CBCentralManager
    private var wifiConnectivityChecker: WifiConnectivityChecker

    init(
        bluetoothManager: CBCentralManager = CBCentralManager(delegate: nil,
                                                              queue: nil,
                                                              options: [CBCentralManagerOptionShowPowerAlertKey: 0]),
        wifiConnectivityChecker: WifiConnectivityChecker = WifiConnectivityChecker()) {
        self.bluetoothManager = bluetoothManager
        self.wifiConnectivityChecker = wifiConnectivityChecker
        super.init()
        self.bluetoothManager.delegate = self
    }
}

extension ReachabilityChecker: ReachabilityChecking {

    public var isBluetoothConnected: Bool {
        return bluetoothEnabled
    }

    public var isConnectedToWifi: Bool {
        return wifiConnectivityChecker.wifiConnected
    }
}

extension ReachabilityChecker: CBCentralManagerDelegate {

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bluetoothEnabled = central.state == .poweredOn
    }
}
