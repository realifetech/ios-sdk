//
//  SDKConfigurationTests.swift
//  RealifeTech
//
//  Created by Olivier Butler on 26/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class SDKConfigurationTests: XCTestCase {

    func test_initialisation() {
        let testAppCode = "CodeForApp"
        let testClientSecret = "Shuuu"
        let testApiUrl = "1234Marched"
        let testGraphApiUrl = "Lemons"
        let sut = SDKConfiguration(
            appCode: testAppCode,
            clientSecret: testClientSecret,
            apiUrl: testApiUrl,
            graphApiUrl: testGraphApiUrl)
        XCTAssertEqual(testAppCode, sut.appCode)
        XCTAssertEqual(testClientSecret, sut.clientSecret)
        XCTAssertEqual(testApiUrl, sut.apiUrl)
        XCTAssertEqual(testGraphApiUrl, sut.graphApiUrlString)
    }

    func test_defaults_areUrls() {
        XCTAssertNotNil(URL(string: SDKConfiguration.defaultApiUrl))
        XCTAssertNotNil(URL(string: SDKConfiguration.defaultGraphApiUrl))
    }

    func test_defaults_areUsed() {
        let sut = SDKConfiguration(appCode: "", clientSecret: "")
        XCTAssertEqual(sut.apiUrl, SDKConfiguration.defaultApiUrl)
        XCTAssertEqual(sut.graphApiUrlString, SDKConfiguration.defaultGraphApiUrl)
    }

    func test_graphApiUrl() {
        let testUrlString = "http://realifetech.com"
        let sut = SDKConfiguration(appCode: "", clientSecret: "", graphApiUrl: testUrlString)
        XCTAssertEqual(sut.graphApiUrl.absoluteString, testUrlString)
    }
}
