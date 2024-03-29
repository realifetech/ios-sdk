//
//  AnalyticsLoggerTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech
@testable import GraphQL

typealias PutAnalyticEventMutationDataType = ApolloType.PutAnalyticEventMutation.Data

final class AnalyticsLoggerTests: XCTestCase {

    private var sut: AnalyticsLogger!
    private var mockGraphQLManager: MockGraphQLManager<PutAnalyticEventMutationDataType>!
    private var mockQueue: MockQueue<AnalyticEventAndCompletion>!
    private var mockReachabilityChecker: MockReachabilityChecker!
    private var mockDeviceRegistering: MockDeviceRegistering!
    private var identityPersister: IdentityPersister!

    private let testEvent = AnalyticEvent(
        type: "a",
        action: "b",
        version: "c")

    override func setUp() {
        super.setUp()
        mockGraphQLManager = MockGraphQLManager<PutAnalyticEventMutationDataType>()
        mockReachabilityChecker = MockReachabilityChecker()
        mockQueue = MockQueue<AnalyticEventAndCompletion>()
        mockDeviceRegistering = MockDeviceRegistering()
        identityPersister = IdentityPersister(defaults: .standard)
        sut = makeSut()
    }

    override func tearDown() {
        mockDeviceRegistering = nil
        mockQueue = nil
        mockReachabilityChecker = nil
        mockGraphQLManager = nil
        identityPersister.clear()
        sut = nil
        super.tearDown()
    }

    private func makeSut(withMaxAttempts maxAttempts: Int = 0) -> AnalyticsLogger {
        return AnalyticsLogger(
            graphQLManager: mockGraphQLManager,
            reachabilityHelper: mockReachabilityChecker,
            persistentQueue: AnyQueue(mockQueue),
            failureDebounceSeconds: 0.01,
            deviceRegistering: mockDeviceRegistering,
            identityPersister: IdentityPersister(defaults: .standard),
            maxAttempts: maxAttempts)
    }

    private func makeEvents(from strings: [String]) -> [AnalyticEvent] {
        return strings
            .map { AnalyticEvent(type: $0, action: $0, version: $0) }
    }

    func makeStubAnalyticsEventMutation(
        shouldReturnSuccess: Bool = true
    ) -> GraphQLResult<PutAnalyticEventMutationDataType> {
        let putAnalyticEvent = ApolloType.PutAnalyticEventMutation.Data.PutAnalyticEvent(success: shouldReturnSuccess)
        let data = PutAnalyticEventMutationDataType(putAnalyticEvent: putAnalyticEvent)
        return GraphQLResult<PutAnalyticEventMutationDataType>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil)
    }

    func test_init_emptyStorage_doNothing() {
        mockQueue.underlyingStorage = []
        mockReachabilityChecker.hasNetworkConnection = true
        _ = makeSut()
        XCTAssertFalse(mockGraphQLManager.dispatchMutationIsCalled)
    }

    func test_init_hasItemInPersistentQueue_sendItem() {
        let testEvents = makeEvents(from: ["eventOne", "eventTwo"])
        let expectation = XCTestExpectation(description: "Queue was emptied")
        mockQueue.underlyingStorage = testEvents.map {
            AnalyticEventAndCompletion(analyticEvent: $0, analyticCompletion: nil)
        }
        mockQueue.queueWasEmptiedExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        _ = makeSut()
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(mockGraphQLManager.dispatchMutationIsCalled)
    }

    func test_track_loopIsNotRunning_sendItem() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { _ in expectation.fulfill() }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(mockGraphQLManager.dispatchMutationIsCalled)
    }

    func test_track_onSuccess_reportsSuccessToCaller() {
        let expectation = XCTestExpectation(description: "Event sending fulfilled")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { result in
            switch result {
            case .success(let isSuccess):
                XCTAssertTrue(isSuccess)
                expectation.fulfill()
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_track_onNotSuccess_delaySingleItem() {
        let expectation = XCTestExpectation(description: "Event sending fulfilled")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation(shouldReturnSuccess: false))
        let sut = makeSut()
        sut.track(testEvent) { result in
            switch result {
            case .success(let isSuccess):
                XCTAssertFalse(isSuccess)
                expectation.fulfill()
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_track_onFailure_delaySingleItem() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.resultReturns = .failure(DummyError.failure)
        let sut = makeSut()
        sut.track(testEvent) { result in
            switch result {
            case .success:
                XCTFail("We should have faliure sent this")
            case .failure:
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_track_hasNoNetworkConnection_delaysSingleItemUntilConnected() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = false
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { result in
            switch result {
            case .success:
                XCTAssertTrue(self.mockGraphQLManager.dispatchMutationIsCalled)
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
            expectation.fulfill()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
            self.mockReachabilityChecker.hasNetworkConnection = true
        }
        wait(for: [expectation], timeout: 0.02)
    }

    func test_track_deviceHasntBeenRegistered_delaysSingleItemUntilRegistered() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockDeviceRegistering.shouldBeReady = false
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { result in
            switch result {
            case .success:
                XCTAssertTrue(self.mockGraphQLManager.dispatchMutationIsCalled)
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
            expectation.fulfill()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
            self.mockDeviceRegistering.shouldBeReady = true
        }
        wait(for: [expectation], timeout: 0.02)
    }

    func test_track_addsItemsToQueue() {
        let expectation = XCTestExpectation(description: "Item was added to queue")
        mockQueue.addedToQueueExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = false
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { _ in }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(mockQueue.underlyingStorage.first?.analyticEvent, testEvent)
    }

    func test_track_removesFromQueueWhenDone() {
        test_track_onSuccess_reportsSuccessToCaller()
        XCTAssertTrue(mockQueue.isEmpty)
    }

    func test_track_leavesInQueueOnFailure() {
        test_track_hasNoNetworkConnection_delaysSingleItemUntilConnected()
        XCTAssertEqual(mockQueue.receivedQueueActions.first, .doNothing)
        XCTAssertEqual(mockQueue.receivedQueueActions.last, .removeFirst)
    }

    func test_track_willContinueWhenGivenMoreItems() {
        test_init_hasItemInPersistentQueue_sendItem()
        test_track_loopIsNotRunning_sendItem()
    }

    func test_track_noPersistedUserId() {
        identityPersister.persist(userId: "123")
        identityPersister.clear()
        let expectation = XCTestExpectation(description: "Item was added to queue")
        mockQueue.addedToQueueExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = false
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { _ in }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertNil(mockQueue.underlyingStorage.first?.analyticEvent.userId)
    }

    func test_track_persistedUserIdIncluded() {
        identityPersister.persist(userId: "123")
        let expectation = XCTestExpectation(description: "Item was added to queue")
        mockQueue.addedToQueueExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = false
        mockGraphQLManager.resultReturns = .success(makeStubAnalyticsEventMutation())
        let sut = makeSut()
        sut.track(testEvent) { _ in }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(mockQueue.underlyingStorage.first?.analyticEvent.userId, "123")
    }

    func test_track_onFailure_shouldAttemptToRetry() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockQueue.underlyingStorage = []
        sut.track(testEvent) { result in
            switch result {
            case .success:
                XCTFail("This should hit the failure case")
            case .failure:
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(mockGraphQLManager.numberOfMutationsCalled, 2)
    }
}

final class MockDeviceRegistering: DeviceRegistering {

    var shouldBeReady = true
    var sdkReady: Bool { shouldBeReady }
    let deviceId: String = ""

    func registerDevice(_: @escaping (Bool) -> Void) { }
    func updateMyDeviceConsent(_ deviceConsent: DeviceConsent, completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(true))
    }
}

private final class MockQueue<Queue: Codable & Identifiable>: QueueProviding {

    var next: Result<QueueItem<Queue>, QueueRetrievalError> { getNext() }
    var count: Int { underlyingStorage.count }
    var isEmpty: Bool { underlyingStorage.isEmpty }
    var queueWasEmptiedExpectation: XCTestExpectation?
    var addedToQueueExpectation: XCTestExpectation?

    var underlyingStorage: [Queue] = [] {
        didSet {
            guard underlyingStorage.isEmpty else { return }
            queueWasEmptiedExpectation?.fulfill()
        }
    }
    var receivedQueueActions: [QueueAction] = []

    func getNext() -> Result<QueueItem<Queue>, QueueRetrievalError> {
        guard let next = underlyingStorage.first else {
            return .failure(.empty)
        }
        return .success(.init(item: next, releaseQueue: recordQueueRelease))
    }

    func recordQueueRelease(_ action: QueueAction) {
        receivedQueueActions.append(action)
        switch action {
        case .removeFirst:
            _ = underlyingStorage.removeFirst()
        case .sendFirstToBack, .doNothing:
            break
        }
    }

    func addToQueue(_ item: Queue) {
        underlyingStorage.append(item)
        addedToQueueExpectation?.fulfill()
    }
}
