//
//  DeviceTokenTests.swift
//  General
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import Repositories

class DeviceTokenTests: XCTestCase {

    func test_defaultDeviceToken() {
        let testToken = "TOKEN-TIME"
        let sut = DeviceToken.defaultDeviceToken(withProviderToken: testToken)
        XCTAssertEqual(sut.provider, "APPLE")
        XCTAssertEqual(sut.providerToken, testToken)
    }
}
