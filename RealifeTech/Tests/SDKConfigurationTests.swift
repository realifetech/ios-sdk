//
//  SDKConfigurationTests.swift
//  RealifeTech
//
//  Created by Olivier Butler on 26/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class SDKConfigurationTests: XCTestCase {

    func test_initialisation() {
        let testAppCode = "CodeForApp"
        let testClientSecret = "Shuuu"
        let testApiUrl = "1234Marched"
        let testGraphQLApiUrl = "Lemons"
        let testAppVersion = "15.9"
        let testAppGroupId = "group.com.bundleId"
        let sut = SDKConfiguration(
            appCode: testAppCode,
            appVersion: testAppVersion,
            clientSecret: testClientSecret,
            appGroupId: testAppGroupId,
            apiUrl: testApiUrl,
            graphQLApiUrl: testGraphQLApiUrl)
        XCTAssertEqual(testAppCode, sut.appCode)
        XCTAssertEqual(testClientSecret, sut.clientSecret)
        XCTAssertEqual(testApiUrl, sut.apiUrl)
        XCTAssertEqual(testGraphQLApiUrl, sut.graphQLApiUrl)
        XCTAssertEqual(testAppGroupId, sut.appGroupId)
    }

    func test_defaults_areUrls() {
        XCTAssertNotNil(URL(string: SDKConfiguration.defaultApiUrl))
        XCTAssertNotNil(URL(string: SDKConfiguration.defaultGraphQLApiUrl))
        XCTAssertNotNil(URL(string: SDKConfiguration.defaultWebOrderingJourneyUrl))
    }

    func test_defaults_areUsed() {
        let sut = SDKConfiguration(appCode: "", appVersion: "", clientSecret: "", appGroupId: "")
        XCTAssertEqual(sut.apiUrl, SDKConfiguration.defaultApiUrl)
        XCTAssertEqual(sut.graphQLApiUrl, SDKConfiguration.defaultGraphQLApiUrl)
        XCTAssertEqual(sut.webOrderingJourneyUrl, SDKConfiguration.defaultWebOrderingJourneyUrl)
    }
}

