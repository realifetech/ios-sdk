//
//  RealifeTechTests.swift
//  RealifeTechTests
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class RealifeTechTests: XCTestCase {

    func test_setup_modulesAreAvailable() {
        let configuration = SDKConfiguration(appCode: "", clientSecret: "")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertNotNil(RealifeTech.General)
    }

    func testPerformance_setup() {
        self.measure {
            let configuration = SDKConfiguration(appCode: "test", clientSecret: "")
            RealifeTech.configureSDK(with: configuration)
        }
    }

}
