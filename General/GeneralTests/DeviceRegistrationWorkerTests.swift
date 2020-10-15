//
//  DeviceRegistrationWorkerTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import Repositories
import ReachabilityChecker
import RxSwift
@testable import General

class DeviceRegistrationWorkerTests: XCTestCase {

    var sut: DeviceRegistrationWorker!
    var reachabilityChecker: MockReachabilityChecker!

    lazy var testDevice = Device(
        deviceId: "GODZILLA",
        model: "TREX",
        sdkVersion: "KONG",
        osVersion: "MOTHRA",
        bluetoothOn: true,
        wifiConnected: false)

    override func setUp() {
        reachabilityChecker = MockReachabilityChecker()
        sut = DeviceRegistrationWorker(
            reachabilityChecker: reachabilityChecker,
            debounceRateSeconds: 1,
            scheduler: MainScheduler.instance,
            deviceProvider: MockDeviceRepository.self)
    }

    func test_registerDevice_success() {
        MockDeviceRepository.deviceReceived = nil
        MockDeviceRepository.observableToReturn = .just(true)
        reachabilityChecker.hasNetworkConnection = true
        let expectation = XCTestExpectation(description: "Device registered")
        sut.registerDevice(testDevice, { _ in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(MockDeviceRepository.deviceReceived, testDevice)
    }

    func test_registerDevice_

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
