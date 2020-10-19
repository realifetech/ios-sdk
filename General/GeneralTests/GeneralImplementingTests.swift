//
//  GeneralImplementingTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import General

class GeneralImplementingTests: XCTestCase {

    private var sut: GeneralImplementing!
    private var mockDeviceRegistering: DeviceRegisteringMock!

    override func setUp() {
        mockDeviceRegistering = DeviceRegisteringMock()
        sut = GeneralImplementing(deviceRegistrationWorker: mockDeviceRegistering)
    }

    func test_deviceRegistering_forwardsFunctionality() {
        mockDeviceRegistering.deviceId = "HattyTurnip"
        mockDeviceRegistering.sdkReady = true
        sut.registerDevice { _ in}
        XCTAssertEqual(sut.deviceId, mockDeviceRegistering.deviceId)
        XCTAssertEqual(sut.sdkReady, mockDeviceRegistering.sdkReady)
        XCTAssertTrue(mockDeviceRegistering.receivedCallToRegisterDevice)
    }
}

private class DeviceRegisteringMock: DeviceRegistering {

    var sdkReady: Bool = false
    var deviceId: String = ""
    var receivedCallToRegisterDevice: Bool = false

    func registerDevice(_: @escaping (Result<Void, Error>) -> Void) {
        receivedCallToRegisterDevice = true
    }
}
