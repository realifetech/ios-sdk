//
//  DeviceRequesterTests.swift
//  RepositoriesTests
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class DeviceRequesterTests: XCTestCase {

    private let sut = DeviceRequester.self

    func test_registerForPushNotifications() throws {
        let testTokenString = "Test_TOKEN"
        let testToken = DeviceToken.defaultDeviceToken(withProviderToken: testTokenString)
        let requestToTest = sut.register(tokenForPushNotificationsWithDeviceToken: testToken)
        XCTAssertEqual(requestToTest.url?.path, "/device/me/token")
        let data = try XCTUnwrap(requestToTest.httpBody)
        let jsonObject = try XCTUnwrap(JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments) as? [String: Any])
        XCTAssertEqual(jsonObject["providerToken"] as? String, testTokenString)
    }
}
