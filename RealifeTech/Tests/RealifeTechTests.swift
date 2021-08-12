//
//  RealifeTechTests.swift
//  RealifeTechTests
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class RealifeTechTests: XCTestCase {

    func test_setup_modulesAreAvailable() {
        let configuration = SDKConfiguration(appCode: "", clientSecret: "")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertNotNil(RealifeTech.Core)
        XCTAssertNotNil(RealifeTech.General)
        XCTAssertNotNil(RealifeTech.Audiences)
        XCTAssertNotNil(RealifeTech.Analytics)
        XCTAssertNotNil(RealifeTech.Communicate)
        XCTAssertNotNil(RealifeTech.Canvas)
        XCTAssertNotNil(RealifeTech.Content)
        XCTAssertNotNil(RealifeTech.Sell)
    }
}
