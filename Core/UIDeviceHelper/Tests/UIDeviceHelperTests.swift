//
//  UIDeviceHelperTests.swift
//  UIDeviceHelperTests
//
//  Created by Realife Tech on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class UIDeviceHelperTests: XCTestCase {

    func test_makeUIDeviceHelper_withDeviceId() {
        let mockDevice = MockDevice()
        let testDeviceId = "123456789"
        let sut = UIDeviceFactory.makeUIDeviceHelper(device: mockDevice, deviceId: testDeviceId)
        XCTAssertEqual(sut.deviceId, testDeviceId)
    }

    func test_makeUIDeviceHelper_withNilDeviceId_returnIDFV() {
        let mockDevice = MockDevice()
        let sut = UIDeviceFactory.makeUIDeviceHelper(device: mockDevice, deviceId: nil)
        XCTAssertEqual(sut.deviceId, "00000000-4321-1234-4321-000000000000")
    }

    func test_deviceModel() {
        let mockDevice = MockDevice()
        let sut = UIDeviceFactory.makeUIDeviceHelper(device: mockDevice, deviceId: nil)
        XCTAssertEqual(sut.model, "iPhone")
    }

    func test_deviceSystemVersion() {
        let mockDevice = MockDevice()
        let sut = UIDeviceFactory.makeUIDeviceHelper(device: mockDevice, deviceId: nil)
        XCTAssertEqual(sut.osVersion, "14.0")
    }

    private final class MockDevice: UIDevice {

        override class var current: UIDevice {
            return MockDevice()
        }

        override var identifierForVendor: UUID? {
            return UUID(uuidString: "00000000-4321-1234-4321-000000000000")
        }

        override var modelDescription: String {
            return "iPhone"
        }

        override var systemVersion: String {
            return "14.0"
        }
    }
}
