//
//  GeneralFactoryTests.swift
//  GeneralTests
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class GeneralFactoryTests: XCTestCase {

    func test_setsDeviceId() {
        let testId = "123"
        let staticDeviceInformation = StaticDeviceInformation(
            deviceId: testId,
            deviceModel: "any",
            osVersion: "thing",
            sdkVersion: "goes")
        let sut = GeneralFactory.makeGeneralModule(
            staticDeviceInformation: staticDeviceInformation,
            reachabilityChecker: ReachabilityFactory.makeReachabilityHelper(),
            graphQLManager: MockGraphQLManager<Data.Type>())
        XCTAssertEqual(testId, sut.deviceId)
    }
}
