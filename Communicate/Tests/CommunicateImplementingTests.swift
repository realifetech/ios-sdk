//
//  CommunicateImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
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
        sut = CommunicateImplementing(
            pushNotificationRegistrar: pushNotificationRegistrar,
            analytics: analytics,
            graphQLManager: MockGraphQLManager<ApolloType.GetNotificationConsentsQuery.Data>())
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

    func test_getNotificationConsents_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetNotificationConsentsQuery.Data.self)
        let getNotificationConsentResponse = ApolloType.GetNotificationConsentsQuery
            .Data
            .GetNotificationConsent(unsafeResultMap: [
                "id": "1",
                "sortId": 1,
                "name": "test1",
                "status": ApolloType.ConsentStatus(rawValue: "ACTIVE"),
                "translations": []])
        let data = ApolloType.GetNotificationConsentsQuery
            .Data(getNotificationConsents: [getNotificationConsentResponse])
        let expectedResult = GraphQLResult<ApolloType.GetNotificationConsentsQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.getNotificationConsents { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.count, expectedResult.data?.getNotificationConsents?.count)
            XCTAssertEqual(returnedResponse.first?.id, "1")
            XCTAssertEqual(returnedResponse.first?.name, "test1")
        }
    }

    func test_getNotificationConsents_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetNotificationConsentsQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getNotificationConsents { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    func test_getMyNotificationConsents_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(
            ofType: ApolloType.GetMyDeviceNotificationConsentsQuery.Data.self)
        let getMyNotificationConsents = ApolloType.GetMyDeviceNotificationConsentsQuery
            .Data
            .GetMyDeviceNotificationConsent(unsafeResultMap: [
            "id": "11",
            "enabled": false,
            "consent": [
                "id": "2",
                "sortId": 2,
                "name": "test2",
                "status": ApolloType.ConsentStatus(rawValue: "ACTIVE") ?? .disabled,
                "translations": []]])
        let data = ApolloType.GetMyDeviceNotificationConsentsQuery
            .Data(getMyDeviceNotificationConsents: [getMyNotificationConsents])
        let expectedResult = GraphQLResult<ApolloType.GetMyDeviceNotificationConsentsQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.getMyNotificationConsents { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.first?.id, "11")
            XCTAssertEqual(returnedResponse.first?.enabled, false)
            XCTAssertEqual(returnedResponse.first?.consent.status.rawValue, "ACTIVE")
        }
    }

    func test_getMyNotificationConsents_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(
            ofType: ApolloType.GetMyDeviceNotificationConsentsQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getNotificationConsents { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    func test_updateMyNotificationConsent_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(
            ofType: ApolloType.UpdateMyDeviceNotificationConsentMutation.Data.self)
        let data = ApolloType.UpdateMyDeviceNotificationConsentMutation.Data(updateMyDeviceNotificationConsent: nil)
        let expectedResult = GraphQLResult<ApolloType.UpdateMyDeviceNotificationConsentMutation.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.updateMyNotificationConsent(id: "3", enabled: true) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertTrue(returnedResponse)
        }
    }

    func test_updateMyNotificationConsent_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(
            ofType: ApolloType.UpdateMyDeviceNotificationConsentMutation.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getNotificationConsents { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    private func convertToString(_ dictionary: [String: Any]?) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary ?? [:], options: []) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: CommunicateImplementing) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = CommunicateImplementing(
            pushNotificationRegistrar: pushNotificationRegistrar,
            analytics: analytics,
            graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
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
