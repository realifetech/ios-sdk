//
//  DeviceRegistrationWorkerTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 15/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
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

    override func setUp() {
        deviceRegistrationSpy = MockDeviceRegistrationLoopHandler()
        mockReachabilityChecker = MockReachabilityChecker()
        sut = DeviceRegistrationWorker(
            deviceId: testId,
            deviceModel: testModel,
            osVersion: osVersion,
            sdkVersion: sdkVersion,
            reachabilityChecker: mockReachabilityChecker,
            loopHandler: deviceRegistrationSpy)
    }

    func test_initialisation() {
        XCTAssertEqual(sut.deviceId, testId)
    }

    func test_sdkReady() {
        XCTAssertFalse(sut.sdkReady)
        sut.registerDevice { }
        XCTAssertTrue(sut.sdkReady)
    }

    func test_registerDevice_resultIsCorrect() {
        let expectation = XCTestExpectation(description: "Device registration completion")
        let testError: TestError = TestError.registrationError("hello")
        deviceRegistrationSpy.resultToReturn = .failure(testError)
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
            sdkVersion: sdkVersion,
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
    var resultToReturn: Result<Void, Error> = .success(())

    func registerDevice(_: Device, _: @escaping () -> Void) {
//        self.deviceReceived = device
//        completion(resultToReturn)
    }
}