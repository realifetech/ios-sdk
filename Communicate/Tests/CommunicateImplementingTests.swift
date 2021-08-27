//
//  CommunicateImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class CommunicateImplementingTests: XCTestCase {

    private var sut: CommunicateImplementing!
    private var pushNotificationRegistrar: MockPushNotificationRegistrar!

    override func setUp() {
        super.setUp()
        pushNotificationRegistrar = MockPushNotificationRegistrar()
        sut = CommunicateImplementing(pushNotificationRegistrar: pushNotificationRegistrar)
    }

    override func tearDown() {
        sut = nil
        pushNotificationRegistrar = nil
        super.tearDown()
    }

    func test_registerForPushNotificationsWithToken() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.registerForPushNotifications(token: "A") { _ in
            XCTAssertEqual(self.pushNotificationRegistrar.receivedToekn, "A")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_registerForPushNotificationsWithData() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.registerForPushNotifications(tokenData: Data()) { _ in
            XCTAssertNotNil(self.pushNotificationRegistrar.receivedData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

private final class MockPushNotificationRegistrar: PushNotificationRegistering {

    var receivedToekn: String?
    var receivedData: Data?

    func registerForPushNotifications(token: String, completion: @escaping (Result<Void, Error>) -> Void) {
        receivedToekn = token
        completion(.success(()))
    }

    func registerForPushNotifications(tokenData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        receivedData = tokenData
        completion(.success(()))
    }
}
