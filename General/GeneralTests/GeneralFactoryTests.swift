//
//  GeneralFactoryTests.swift
//  GeneralTests
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import ReachabilityChecker
@testable import General

class GeneralFactoryTests: XCTestCase {

    func test_setsDeviceId() {
        let testId = "123"
        let sut = GeneralFactory.makeGeneralModule(
            deviceId: testId, deviceModel: "any", osVersion: "thing",
            reachabilityChecker: ReachabilityFactory.makeReachabilityHelper())
        XCTAssertEqual(testId, sut.deviceId)
    }
}
