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
    private var reachabilityHelper: ReachabilityHelper

    init(
        bluetoothManager: CBCentralManager = CBCentralManager(delegate: nil,
                                                              queue: nil,
                                                              options: [CBCentralManagerOptionShowPowerAlertKey: 0]),
        reachabilityHelper: ReachabilityHelper = ReachabilityHelper()) {
        self.bluetoothManager = bluetoothManager
        self.reachabilityHelper = reachabilityHelper
        super.init()
        self.bluetoothManager.delegate = self
    }
}

extension ReachabilityChecker: ReachabilityChecking {

    public var isBluetoothConnected: Bool {
        return bluetoothEnabled
    }

    public var isConnectedToWifi: Bool {
        return reachabilityHelper.wifiConnected
    }
}

extension ReachabilityChecker: CBCentralManagerDelegate {

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bluetoothEnabled = central.state == .poweredOn
    }
}
