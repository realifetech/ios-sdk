//
//  ReachabilityCheckerTests.swift
//  ReachabilityCheckerTests
//
//  Created by Olivier Butler on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import CoreBluetooth
@testable import ReachabilityChecker

class ReachabilityCheckerTests: XCTestCase {

    func test_bluetooth_enabled() {
        let mockBluetoothManager = MockBluetoothManager()
        mockBluetoothManager.bluetoothEnabled = true
        let sut = ReachabilityChecker(bluetoothManager: mockBluetoothManager)
        sut.centralManagerDidUpdateState(mockBluetoothManager)
        XCTAssertTrue(sut.isBluetoothConnected)
    }

    func test_bluetooth_disabled() {
        let mockBluetoothManager = MockBluetoothManager()
        let sut = ReachabilityChecker(bluetoothManager: mockBluetoothManager)
        sut.centralManagerDidUpdateState(mockBluetoothManager)
        XCTAssertFalse(sut.isBluetoothConnected)
    }

    func test_wifi_connected() {
        let mockHelper = MockReachabilityHelper()
        mockHelper.wifiEnabled = true
        let sut = ReachabilityChecker(reachabilityHelper: mockHelper)
        XCTAssertTrue(sut.isConnectedToWifi)
    }

    func test_wifi_notConnected() {
        let mockHelper = MockReachabilityHelper()
        let sut = ReachabilityChecker(reachabilityHelper: mockHelper)
        XCTAssertFalse(sut.isConnectedToWifi)
    }

    private class MockBluetoothManager: CBCentralManager {
        var bluetoothEnabled: Bool = false

        override var state: CBManagerState {
            return bluetoothEnabled ? .poweredOn : .poweredOff
        }
    }

    private class MockReachabilityHelper: ReachabilityHelper {
        var wifiEnabled: Bool = false

        override var wifiConnected: Bool {
            return wifiEnabled
        }
    }
}
