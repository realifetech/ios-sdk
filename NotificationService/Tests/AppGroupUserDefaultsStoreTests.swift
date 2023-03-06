//
//  AppGroupUserDefaultsStoreTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2022/6/28.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AppGroupUserDefaultsStoreTests: XCTestCase {

    private var sut: AppGroupUserDefaultsStore!
    private var testUserDefaults: UserDefaults?
    private let testSDKConfiguration = SDKConfiguration(
        appCode: "appCodeTest",
        appVersion: "testAppVersion",
        clientSecret: "clientSecretTest",
        apiUrl: "any_apiUrl",
        graphQLApiUrl: "any_graphQLApiUrl",
        webOrderingJourneyUrl: "any_url")
    private let testId = "AppGroupUserDefaultsStoreTests"
    private let prefix = AppGroupStoreKey.prefix.rawValue
    private let configurationKey = AppGroupStoreKey.configurationKey.rawValue

    override func setUp() {
        super.setUp()
        sut = AppGroupUserDefaultsStore(appGroupId: testId)
        testUserDefaults = UserDefaults(suiteName: testId)
    }

    func test_saveSDKConfiguration() {
        sut.saveSDKConfiguration(with: testSDKConfiguration)
        if let configurationData = testUserDefaults?.object(forKey: prefix + configurationKey) as? Data {
            let configuration = try? JSONDecoder().decode(SDKConfiguration.self, from: configurationData)
            XCTAssertEqual(configuration?.appCode, testSDKConfiguration.appCode)
            XCTAssertEqual(configuration?.appVersion, testSDKConfiguration.appVersion)
            XCTAssertEqual(configuration?.clientSecret, testSDKConfiguration.clientSecret)
            XCTAssertEqual(configuration?.apiUrl, testSDKConfiguration.apiUrl)
            XCTAssertEqual(configuration?.graphQLApiUrl, testSDKConfiguration.graphQLApiUrl)
            XCTAssertEqual(configuration?.webOrderingJourneyUrl, testSDKConfiguration.webOrderingJourneyUrl)
        } else {
            XCTFail("Failed with saveSDKConfiguration")
        }
    }

    func test_fetchSDKConfiguration() {
        test_saveSDKConfiguration()
        guard let returnedConfiguration = sut.fetchSDKConfiguration() else {
            return XCTFail("Failed with fetchSDKConfiguration")
        }
        XCTAssertEqual(returnedConfiguration.appCode, testSDKConfiguration.appCode)
        XCTAssertEqual(returnedConfiguration.clientSecret, testSDKConfiguration.clientSecret)
        XCTAssertEqual(returnedConfiguration.apiUrl, testSDKConfiguration.apiUrl)
        XCTAssertEqual(returnedConfiguration.graphQLApiUrl, testSDKConfiguration.graphQLApiUrl)
        XCTAssertEqual(returnedConfiguration.webOrderingJourneyUrl, testSDKConfiguration.webOrderingJourneyUrl)
    }
}
