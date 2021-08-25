//
//  GeneralImplementingTests.swift
//  GeneralTests
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
@testable import RealifeTech

final class GeneralImplementingTests: XCTestCase {

    private var sut: GeneralImplementing!
    private var mockDeviceRegistering: DeviceRegisteringMock!

    override func setUp() {
        super.setUp()
        mockDeviceRegistering = DeviceRegisteringMock()
        sut = GeneralImplementing(deviceRegistrationWorker: mockDeviceRegistering)
    }

    override func tearDown() {
        sut = nil
        mockDeviceRegistering = nil
        super.tearDown()
    }

    func test_deviceRegistering_forwardsFunctionality() {
        mockDeviceRegistering.deviceId = "HattyTurnip"
        mockDeviceRegistering.sdkReady = true
        sut.registerDevice { }
        XCTAssertEqual(sut.deviceId, mockDeviceRegistering.deviceId)
        XCTAssertEqual(sut.sdkReady, mockDeviceRegistering.sdkReady)
        XCTAssertTrue(mockDeviceRegistering.receivedCallToRegisterDevice)
    }

    func test_setColor_setDifferentTypes_setIsUpdated() throws {
        sut.setColor(.black, for: .primary)
        sut.setColor(.blue, for: .onPrimary)
        XCTAssertEqual(sut.storedColours.count, 2)
        let primaryColor = try XCTUnwrap(sut.storedColours.first { $0.type == .primary }?.color)
        XCTAssertEqual(primaryColor, .black)
        let onPrimaryColor = try XCTUnwrap(sut.storedColours.first { $0.type == .onPrimary }?.color)
        XCTAssertEqual(onPrimaryColor, .blue)
    }

    func test_setColor_setSameType_setIsUpdated() throws {
        sut.setColor(.black, for: .primary)
        sut.setColor(.red, for: .primary)
        XCTAssertEqual(sut.storedColours.count, 1)
        let primaryColor = try XCTUnwrap(sut.storedColours.first { $0.type == .primary }?.color)
        XCTAssertEqual(primaryColor, .red)
    }

    func test_getColor_typeFound_returnsColor() throws {
        try test_setColor_setDifferentTypes_setIsUpdated()
        XCTAssertEqual(sut.getColor(for: .primary), Color(.black))
    }

    func test_getColor_typeNotFound_returnsDefaultColor() throws {
        try test_setColor_setDifferentTypes_setIsUpdated()
        XCTAssertEqual(sut.getColor(for: .neutral), ColorType.neutral.default)
    }
}

private final class DeviceRegisteringMock: DeviceRegistering {

    var sdkReady: Bool = false
    var deviceId: String = ""
    var receivedCallToRegisterDevice: Bool = false

    func registerDevice(_: @escaping () -> Void) {
        receivedCallToRegisterDevice = true
    }
}
