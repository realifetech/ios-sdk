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
        let configuration = SDKConfiguration(appCode: "", appVersion: "", clientSecret: "", appGroupId: "", keychainSharingId: "")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertNotNil(RealifeTech.Core)
        XCTAssertNotNil(RealifeTech.General)
        XCTAssertNotNil(RealifeTech.Audiences)
        XCTAssertNotNil(RealifeTech.Analytics)
        XCTAssertNotNil(RealifeTech.Communicate)
        XCTAssertNotNil(RealifeTech.Canvas)
        XCTAssertNotNil(RealifeTech.Content)
        XCTAssertNotNil(RealifeTech.Sell)
        XCTAssertNotNil(RealifeTech.Identity)
    }

    func test_clearAllInterface_modulesAreCleared() {
        test_setup_modulesAreAvailable()
        RealifeTech.clearAllInterfaces()
        XCTAssertNil(RealifeTech.Core)
        XCTAssertNil(RealifeTech.General)
        XCTAssertNil(RealifeTech.Audiences)
        XCTAssertNil(RealifeTech.Analytics)
        XCTAssertNil(RealifeTech.Communicate)
        XCTAssertNil(RealifeTech.Canvas)
        XCTAssertNil(RealifeTech.Content)
        XCTAssertNil(RealifeTech.Sell)
        XCTAssertNil(RealifeTech.Identity)
    }

    func test_setWebOrderingJourneyUrl_sellsOrderingJourneyUrlIsUpdated() {
        let configuration = SDKConfiguration(
            appCode: "",
            appVersion: "",
            clientSecret: "",
            appGroupId: "",
            keychainSharingId: "",
            webOrderingJourneyUrl: "A")
        RealifeTech.configureSDK(with: configuration)
        XCTAssertEqual(RealifeTech.Sell.orderingJourneyUrl, "A")
        RealifeTech.set(webOrderingJourneyUrl: "B")
        XCTAssertEqual(RealifeTech.Sell.orderingJourneyUrl, "B")
    }
}
