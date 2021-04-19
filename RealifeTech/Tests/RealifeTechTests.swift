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
        let configuration = CoreConfiguration(appCode: "", clientSecret: "")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertNotNil(RealifeTech.General)
    }
}
