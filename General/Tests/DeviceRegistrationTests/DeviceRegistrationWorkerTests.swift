//
//  DeviceRegistrationWorkerTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 15/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import Combine
@testable import RealifeTech

class DeviceRegistrationWorkerTests: XCTestCase {

    private enum TestError: Error, Equatable {
        case registrationError(String)
    }

    private let testId = "123abc"
    private let testModel = "whooze"
    private let osVersion = "dunny"
    private let sdkVersion = "mittens"

    private var sut: DeviceRegistrationWorker!
    private var deviceRegistrationSpy: MockDeviceRegistrationLoopHandler!
    private var mockReachabilityChecker: MockReachabilityChecker!
    private var deviceRegisteredSubject: CurrentValueSubject<Bool, Never>!
    private var mockStore: MockCodableStore!

    override func setUp() {
        deviceRegistrationSpy = MockDeviceRegistrationLoopHandler()
        mockReachabilityChecker = MockReachabilityChecker()
        deviceRegisteredSubject = .init(false)
        mockStore = MockCodableStore()
        let staticInformation = StaticDeviceInformation(
            deviceId: testId,
            deviceModel: testModel,
            osVersion: osVersion,
            sdkVersion: sdkVersion)
        sut = DeviceRegistrationWorker(
            staticDeviceInformation: staticInformation,
            reachabilityChecker: mockReachabilityChecker,
            loopHandler: deviceRegistrationSpy,
            deviceRegisteredSubject: deviceRegisteredSubject,
            store: mockStore)
    }

    func test_initialisation() {
        XCTAssertEqual(sut.deviceId, testId)
    }

    func test_initialisation_readsFromStore() {
        mockStore.valueToReturn = true
        let staticInformation = StaticDeviceInformation(
            deviceId: testId,
            deviceModel: testModel,
            osVersion: osVersion,
            sdkVersion: sdkVersion)
        let sutWithCustomStore = DeviceRegistrationWorker(
            staticDeviceInformation: staticInformation,
            reachabilityChecker: mockReachabilityChecker,
            loopHandler: deviceRegistrationSpy,
            deviceRegisteredSubject: deviceRegisteredSubject,
            store: mockStore)
        XCTAssertTrue(sutWithCustomStore.sdkReady)
    }

    func test_registerDevice_deviceRegistrationStateIsUpdated() {
        XCTAssertFalse(sut.sdkReady)
        XCTAssertFalse(deviceRegisteredSubject.value)
        sut.registerDevice {}
        XCTAssertTrue(sut.sdkReady)
        XCTAssertTrue(deviceRegisteredSubject.value)
    }

    func test_registerDevice_savesToStore() {
        sut.registerDevice {}
        XCTAssertNotNil(mockStore.valueSaved)
    }

    func test_registerDevice_completionCalled() {
        let expectation = XCTestExpectation(description: "Device registration completion")
        sut.registerDevice {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_registerDevice_deviceIsCorect() {
        let expectation = XCTestExpectation(description: "Device registration completion")
        let testBluetooth = false
        let testDevice = Device(
            deviceId: testId,
            model: testModel,
            sdkVersion: "SDK_" + sdkVersion,
            osVersion: osVersion,
            bluetoothOn: testBluetooth,
            wifiConnected: mockReachabilityChecker.isConnectedToWifi)
        mockReachabilityChecker.isBluetoothConnected = testBluetooth
        sut.registerDevice { expectation.fulfill() }
        guard let recievedDevice = deviceRegistrationSpy.deviceReceived else {
            return XCTFail("No device received")
        }
        XCTAssertEqual(recievedDevice, testDevice)
        wait(for: [expectation], timeout: 0.1)
    }
}

private class MockDeviceRegistrationLoopHandler: DeviceRegistrationLoopHandling {

    var deviceReceived: Device?

    func registerDevice(_ device: Device, _ completion: @escaping () -> Void) {
        self.deviceReceived = device
        completion()
    }
}

private class MockCodableStore: CodableStorageProtocol {
    enum MockCodableStoreError: Error {
        case unexpectedMethodCall, noValueSaved
    }

    var valueToReturn: Any?
    var valueSaved: Any?

    func fetchAll<T>() throws -> [T] where T: Decodable {
        throw MockCodableStoreError.unexpectedMethodCall
    }

    func fetch<T>(for key: String) throws -> T where T: Decodable {
        guard let value = valueToReturn as? T else {
            throw MockCodableStoreError.noValueSaved
        }
        return value
    }

    func save<T>(_ value: T, for key: String) throws where T: Encodable {
        self.valueSaved = value
    }

    func delete(key: String) {}
}
