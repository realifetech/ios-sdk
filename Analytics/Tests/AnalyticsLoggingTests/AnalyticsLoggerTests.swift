//
//  AnalyticsLoggerTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AnalyticsLoggerTests: XCTestCase {

    private var mockGraphQLManager: MockAnalyticsGraphQLManager!
    private var mockQueue: MockQueue<AnalyticEventAndCompletion>!
    private var mockReachabilityChecker: MockReachabilityChecker!
    private var mockDeviceRegistering: MockDeviceRegistering!

    private let testEvent = AnalyticEvent(
        type: "We",
        action: "Want",
        version: "Your")

    override func setUp() {
        super.setUp()
        mockGraphQLManager = MockAnalyticsGraphQLManager()
        mockReachabilityChecker = MockReachabilityChecker()
        mockQueue = MockQueue<AnalyticEventAndCompletion>()
        mockDeviceRegistering = MockDeviceRegistering()
    }

    override func tearDown() {
        mockDeviceRegistering = nil
        mockQueue = nil
        mockReachabilityChecker = nil
        mockGraphQLManager = nil
        super.tearDown()
    }

    private func makeSut() -> AnalyticsLogger {
        return AnalyticsLogger(
            graphQLManager: mockGraphQLManager,
            reachabilityHelper: mockReachabilityChecker,
            persistentQueue: AnyQueue(mockQueue),
            failureDebounceSeconds: 0.01,
            deviceRegistering: mockDeviceRegistering)
    }

    private func makeEvents(from strings: [String]) -> [AnalyticEvent] {
        return strings
            .map { AnalyticEvent(type: $0, action: $0, version: $0) }
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
        _ = makeSut()
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(mockGraphQLManager.dispatchMutationIsCalled)
    }

    func test_logEvent_loopIsNotRunning_sendItem() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        let sut = makeSut()
        sut.logEvent(testEvent) { _ in expectation.fulfill() }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(mockGraphQLManager.dispatchMutationIsCalled)
    }

    func test_logEvent_onSuccess_reportsSuccessToCaller() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        let sut = makeSut()
        sut.logEvent(testEvent) { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_logEvent_onNotSuccess_delaySingleItem() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.successReturns = false
        let sut = makeSut()
        sut.logEvent(testEvent) { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_logEvent_onFailure_delaySingleItem() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockGraphQLManager.shouldReturnFailure = true
        let sut = makeSut()
        sut.logEvent(testEvent) { result in
            switch result {
            case .success:
                XCTFail("We should have faliure sent this")
            case .failure:
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_logEvent_hasNoNetworkConnection_delaysSingleItemUntilConnected() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = false
        let sut = makeSut()
        sut.logEvent(testEvent) { result in
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

    func test_logEvent_deviceHasntBeenRegistered_delaysSingleItemUntilRegistered() {
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        mockDeviceRegistering.shouldBeReady = false
        let sut = makeSut()
        sut.logEvent(testEvent) { result in
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

    func test_logEvent_addsItemsToQueue() {
        let expectation = XCTestExpectation(description: "Item was added to queue")
        mockQueue.addedToQueueExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = false
        let sut = makeSut()
        sut.logEvent(testEvent) { _ in }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(mockQueue.underlyingStorage.first?.analyticEvent, testEvent)
    }

    func test_logEvent_removesFromQueueWhenDone() {
        test_logEvent_onSuccess_reportsSuccessToCaller()
        XCTAssertTrue(mockQueue.isEmpty)
    }

    func test_logEvent_leavesInQueueOnFailure() {
        test_logEvent_hasNoNetworkConnection_delaysSingleItemUntilConnected()
        XCTAssertEqual(mockQueue.receivedQueueActions.first, .doNothing)
        XCTAssertEqual(mockQueue.receivedQueueActions.last, .removeFirst)
    }

    func test_logEvent_willContinueWhenGivenMoreItems() {
        test_init_hasItemInPersistentQueue_sendItem()
        test_logEvent_loopIsNotRunning_sendItem()
    }
}

final class MockDeviceRegistering: DeviceRegistering {

    var shouldBeReady = true
    var sdkReady: Bool { shouldBeReady }
    let deviceId: String = ""

    func registerDevice(_: @escaping () -> Void) { }
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
