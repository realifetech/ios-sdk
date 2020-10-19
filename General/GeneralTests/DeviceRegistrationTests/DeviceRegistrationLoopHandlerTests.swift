//
//  DeviceRegistrationLoopHandlerTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
@testable import RealifeTech

class DeviceRegistrationLoopHandlerTests: XCTestCase {

    enum TestError: Error {
        case deviceRegistrationFailed
    }

    var sut: DeviceRegistrationLoopHandler!
    var reachabilityChecker: MockReachabilityChecker!
    let debounceMilliseconds: Int = 50

    var testDevice = Device(
        deviceId: "GODZILLA",
        model: "TREX",
        sdkVersion: "KONG",
        osVersion: "MOTHRA",
        bluetoothOn: true,
        wifiConnected: false)

    override func setUp() {
        reachabilityChecker = MockReachabilityChecker()
        sut = DeviceRegistrationLoopHandler(
            reachabilityChecker: reachabilityChecker,
            debounceRateSeconds: Double(debounceMilliseconds)/1000,
            scheduler: MainScheduler.instance,
            deviceProvider: MockDeviceRepository.self)
    }

    override func tearDown() {
        MockDeviceRepository.deviceReceived = nil
        MockDeviceRepository.observableToReturn = .just(false)
    }

    func test_registerDevice_success() {
        reachabilityChecker.hasNetworkConnection = true
        let expectation = XCTestExpectation(description: "Device registered")
        sut.registerDevice(testDevice, {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(MockDeviceRepository.deviceReceived, testDevice)
    }

    func test_registerDevice_waitsForNetwork() {
        reachabilityChecker.hasNetworkConnection = false
        let expectation = XCTestExpectation(description: "Device registered")
        sut.registerDevice(testDevice, {
            expectation.fulfill()
        })
        XCTAssertNil(MockDeviceRepository.deviceReceived)
        DispatchQueue.main.async {
            self.reachabilityChecker.hasNetworkConnection = true
        }
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(MockDeviceRepository.deviceReceived, testDevice)
    }

    func test_registerDevice_sequentialQueuedCalls() {
        reachabilityChecker.hasNetworkConnection = false
        let expectation1 = XCTestExpectation(description: "1st Device registered")
        let expectation2 = XCTestExpectation(description: "2nd Device registered")
        let expectation3 = XCTestExpectation(description: "3rd Device registered")
        sut.registerDevice(testDevice, {
            expectation1.fulfill()
        })
        sut.registerDevice(testDevice, {
            expectation2.fulfill()
        })
        sut.registerDevice(testDevice, {
            expectation3.fulfill()
        })
        XCTAssertNil(MockDeviceRepository.deviceReceived)
        DispatchQueue.main.async {
            self.reachabilityChecker.hasNetworkConnection = true
        }
        wait(for: [expectation1, expectation2, expectation3],
             timeout: 0.1,
             enforceOrder: true)
    }

    func test_registerDevice_retriesOnFailure() {
        let expectation1 = XCTestExpectation(description: "Async block completed")
        let expectation2 = XCTestExpectation(description: "Device registered")
        let minimumTimeInterval = TimeInterval.init(floatLiteral: Double(self.debounceMilliseconds)/1000)
        reachabilityChecker.hasNetworkConnection = true
        MockDeviceRepository.observableToReturn = .error(TestError.deviceRegistrationFailed)
        let startTime = Date()
        sut.registerDevice(testDevice, {
            let recordedInterval = Date().timeIntervalSince(startTime)
            XCTAssertGreaterThan(recordedInterval, minimumTimeInterval)
            XCTAssertLessThan(recordedInterval, minimumTimeInterval*1.5)
            expectation2.fulfill()
        })
        XCTAssertNil(MockDeviceRepository.deviceReceived)
        DispatchQueue.main.async {
            expectation1.fulfill()
            MockDeviceRepository.observableToReturn = .just(true)
        }
        wait(for: [expectation1, expectation2], timeout: 0.1, enforceOrder: true)
    }
}

private class MockDeviceRepository: DeviceProviding {

    static var observableToReturn: Observable<Bool> = .just(false)
    static var deviceReceived: Device?

    static func registerDevice(_ device: Device) -> Observable<Bool> {
        deviceReceived = device
        return observableToReturn
    }

    static func registerForPushNotifications(with deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return .never()
    }
}
