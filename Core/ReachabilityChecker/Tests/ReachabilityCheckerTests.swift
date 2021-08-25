//
//  ReachabilityCheckerTests.swift
//  ReachabilityCheckerTests
//
//  Created by Realife Tech on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import CoreBluetooth
@testable import RealifeTech

final class ReachabilityCheckerTests: XCTestCase {

    private var sut: ReachabilityChecker!
    private var bluetoothManager: MockBluetoothManager!
    private var networkChecker: MockWifiConnectivityChecker!

    override func setUp() {
        super.setUp()
        bluetoothManager = MockBluetoothManager()
        networkChecker = MockWifiConnectivityChecker()
        sut = ReachabilityChecker(
            bluetoothManager: bluetoothManager,
            networkConnectivityChecker: networkChecker)
    }

    override func tearDown() {
        sut = nil
        networkChecker = nil
        bluetoothManager = nil
        super.tearDown()
    }

    func test_isBluetoothConnected_enabled() {
        bluetoothManager.bluetoothEnabled = true
        XCTAssertTrue(sut.isBluetoothConnected)
    }

    func test_isBluetoothConnected_disabled() {
        bluetoothManager.bluetoothEnabled = false
        XCTAssertFalse(sut.isBluetoothConnected)
    }

    func test_isConnectedToWifi_connected() {
        networkChecker.wifiEnabled = true
        XCTAssertTrue(sut.isConnectedToWifi)
    }

    func test_isConnectedToWifi_notConnected() {
        networkChecker.wifiEnabled = false
        XCTAssertFalse(sut.isConnectedToWifi)
    }

    func test_hasNetworkConnection_yes() {
        networkChecker.shouldHaveNetworkConnection = true
        XCTAssertTrue(sut.hasNetworkConnection)
    }

    func test_hasNetworkConnection_no() {
        networkChecker.shouldHaveNetworkConnection = false
        XCTAssertFalse(sut.hasNetworkConnection)
    }

    func test_isPoorNetworkConnection_yes() {
        networkChecker.shouldBePoorNetworkConnection = true
        XCTAssertTrue(sut.isPoorNetworkConnection)
    }

    func test_isPoorNetworkConnection_no() {
        networkChecker.shouldBePoorNetworkConnection = false
        XCTAssertFalse(sut.isPoorNetworkConnection)
    }
}

private final class MockBluetoothManager: BluetoothManagable {

    var bluetoothEnabled: Bool = false
}

private final class MockWifiConnectivityChecker: NetworkConnectivityChecker {

    var wifiEnabled = false
    var shouldHaveNetworkConnection = false
    var shouldBePoorNetworkConnection = false

    override var wifiConnected: Bool {
        wifiEnabled
    }

    override var hasNetworkConnection: Bool {
        shouldHaveNetworkConnection
    }

    override var isPoorNetworkConnection: Bool {
        shouldBePoorNetworkConnection
    }
}
