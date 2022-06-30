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
    private var analytics: MockAnalyticsLogger!
    private let testTrackInfo = ["custom": ["track": ["pushId": "123"]]]

    override func setUp() {
        super.setUp()
        pushNotificationRegistrar = MockPushNotificationRegistrar()
        analytics = MockAnalyticsLogger()
        sut = CommunicateImplementing(pushNotificationRegistrar: pushNotificationRegistrar, analytics: analytics)
    }

    override func tearDown() {
        sut = nil
        pushNotificationRegistrar = nil
        analytics = nil
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

    func test_trackPush_withPushReceivedEvent() {
        sut.trackPush(event: .received, trackInfo: testTrackInfo) { result in
            switch result {
            case .success:
                let loggedEvent = self.analytics.eventsLogged.first
                XCTAssertEqual(loggedEvent?.type, "user")
                XCTAssertEqual(loggedEvent?.action, "pushReceived")
                let expectedExtractTrack = ["pushId": "123"]
                let trackInfoString = self.convertToString(expectedExtractTrack)
                XCTAssertEqual(loggedEvent?.new, trackInfoString)
                XCTAssertNil(loggedEvent?.old)
            case.failure:
                XCTFail("Should return success")
            }
        }
    }

    func test_trackPush_withPushOpenedEvent() {
        sut.trackPush(event: .opened, trackInfo: testTrackInfo) { result in
            switch result {
            case .success:
                let loggedEvent = self.analytics.eventsLogged.first
                XCTAssertEqual(loggedEvent?.type, "user")
                XCTAssertEqual(loggedEvent?.action, "pushOpened")
                let expectedExtractTrack = ["pushId": "123"]
                let trackInfoString = self.convertToString(expectedExtractTrack)
                XCTAssertEqual(loggedEvent?.new, trackInfoString)
                XCTAssertNil(loggedEvent?.old)
            case.failure:
                XCTFail("Should return success")
            }
        }
    }

    private func convertToString(_ dictionary: [String: Any]?) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary ?? [:], options: []) else { return nil }
        return String(data: data, encoding: .utf8)
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
