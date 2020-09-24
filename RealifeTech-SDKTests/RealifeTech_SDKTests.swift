//
//  RealifeTech_SDKTests.swift
//  RealifeTech-SDKTests
//
//  Created by Olivier Butler on 23/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import XCTest
@testable import RealifeTech_SDK

class RealifeTech_SDKTests: XCTestCase {

    func test_setup_modulesAreAvailable() {
        let configuration = SDKConfiguration(appCode: "", clientSecret: "")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertNotNil(RealifeTech.Communicate)
        XCTAssertNotNil(RealifeTech.General)
    }

    func test_setup_generalModuleConfigureSDK_wasCalled() {

    }


    func testPerformance_setup() {
        self.measure {
            let configuration = SDKConfiguration(appCode: "test", clientSecret: "")
            RealifeTech.configureSDK(with: configuration)
        }
    }

}
