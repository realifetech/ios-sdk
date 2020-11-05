//
//  BluetoothManagerWrapper.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/11/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol BluetoothManagable {
    var bluetoothEnabled: Bool { get }
}

class BluetoothManagerWrapper: BluetoothManagable {

    var bluetoothPermissionGranted: Bool {
        if #available(iOS 13.1, *) {
            return CBCentralManager.authorization == .allowedAlways
        } else {
            return CBCentralManager().authorization == .allowedAlways
        }
    }

    var bluetoothEnabled: Bool {
        guard bluetoothPermissionGranted else { return false }
        return CBCentralManager().state == .poweredOn
    }
}
