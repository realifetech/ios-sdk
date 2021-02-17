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
        let sut = SDKConfiguration(
            appCode: testAppCode,
            clientSecret: testClientSecret,
            apiUrl: testApiUrl,
            graphQLApiUrlString: testGraphQLApiUrl)
        XCTAssertEqual(testAppCode, sut.appCode)
        XCTAssertEqual(testClientSecret, sut.clientSecret)
        XCTAssertEqual(testApiUrl, sut.apiUrl)
        XCTAssertEqual(testGraphQLApiUrl, sut.graphQLApiUrlString)
    }
}
