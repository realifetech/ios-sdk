//
//  CoreConfigurationTests.swift
//  RealifeTech-CoreSDKTests
//
//  Created by Mickey Lee on 10/12/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class CoreConfigurationTests: XCTestCase {

    func test_initialisation() {
        let testAppCode = "CodeForApp"
        let testClientSecret = "Shuuu"
        let testApiUrl = "1234Marched"
        let testGraphQLApiUrl = "Lemons"
        let sut = CoreConfiguration(
            appCode: testAppCode,
            clientSecret: testClientSecret,
            apiUrl: testApiUrl,
            graphQLApiUrl: testGraphQLApiUrl)
        XCTAssertEqual(testAppCode, sut.appCode)
        XCTAssertEqual(testClientSecret, sut.clientSecret)
        XCTAssertEqual(testApiUrl, sut.apiUrl)
        XCTAssertEqual(testGraphQLApiUrl, sut.graphQLApiUrlString)
    }

    func test_defaults_areUrls() {
        XCTAssertNotNil(URL(string: CoreConfiguration.defaultApiUrl))
        XCTAssertNotNil(URL(string: CoreConfiguration.defaultGraphQLApiUrl))
    }

    func test_defaults_areUsed() {
        let sut = CoreConfiguration(appCode: "", clientSecret: "")
        XCTAssertEqual(sut.apiUrl, CoreConfiguration.defaultApiUrl)
        XCTAssertEqual(sut.graphQLApiUrlString, CoreConfiguration.defaultGraphQLApiUrl)
    }

    func test_graphApiUrl() {
        let testUrlString = "http://realifetech.com"
        let sut = CoreConfiguration(appCode: "", clientSecret: "", graphQLApiUrl: testUrlString)
        XCTAssertEqual(sut.graphQLApiUrl.absoluteString, testUrlString)
    }
}
