//
//  AnalyticsLoggerTests.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

// TODO: Add test of failure conditions from the API - implentation is not complete ATM
class AnalyticsLoggerTests: XCTestCase {

    private var mockEventSending: MockAnalyticsLogger!
    private var mockQueue: MockQueue<AnalyticEventAndCompletion>!
    private var mockReachabilityChecker: MockReachabilityChecker!

    override func setUp() {
        self.mockEventSending = MockAnalyticsLogger()
        self.mockReachabilityChecker = MockReachabilityChecker()
        self.mockQueue = MockQueue<AnalyticEventAndCompletion>()
    }

    private func makeSut() -> AnalyticsLogger {
        return AnalyticsLogger(
            dispatcher: mockEventSending,
            reachabilityHelper: mockReachabilityChecker,
            persistentQueue: AnyQueue(mockQueue),
            failureDebounceSeconds: 0.01)
    }

    private func makeEvents(from strings: [String]) -> [AnalyticEvent] {
        return strings
            .map { AnalyticEvent(type: $0, action: $0, version: $0) }
    }

    func test_init_emptyStorageDoesNothing() {
        mockQueue.underlyingStorage = []
        mockReachabilityChecker.hasNetworkConnection = true
        _ = makeSut()
        XCTAssertTrue(mockEventSending.eventsLogged.isEmpty)
    }

    func test_init_sendsItemsFromStorage() {
        let testEvents = makeEvents(from: ["eventOne", "eventTwo"])
        let expectation = XCTestExpectation(description: "Queue was emptied")
        mockQueue.underlyingStorage = testEvents.map {
            AnalyticEventAndCompletion(analyticEvent: $0, analyticCompletion: nil)
        }
        mockQueue.queueWasEmptiedExpectation = expectation
        mockReachabilityChecker.hasNetworkConnection = true
        _ = makeSut()
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual(testEvents, mockEventSending.eventsLogged)
    }

    func test_logEvent_sendsSingleItem() {
        let testEvent = AnalyticEvent(type: "We", action: "Want", version: "Your")
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        let sut = makeSut()
        sut.logEvent(testEvent) { _ in expectation.fulfill() }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertEqual([testEvent], self.mockEventSending.eventsLogged)
    }

    func test_logEvent_onSuccess_reportsSuccessToCaller() {
        let testEvent = AnalyticEvent(type: "We", action: "Want", version: "Your")
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = true
        let sut = makeSut()
        sut.logEvent(testEvent, completion: { result in
            switch result {
            case .success: expectation.fulfill()
            case .failure: XCTFail("We should have sucessfully sent this")
            }
        })
        wait(for: [expectation], timeout: 0.01)
    }

    func test_logEvent_delaysSingleItemUntilConnected() {
        let testEvent = AnalyticEvent(type: "We", action: "Want", version: "Your")
        let expectation = XCTestExpectation(description: "Event sending completed")
        mockReachabilityChecker.hasNetworkConnection = false
        let sut = makeSut()
        sut.logEvent(testEvent, completion: { result in
            switch result {
            case .success:
                XCTAssertEqual([testEvent], self.mockEventSending.eventsLogged)
            case .failure:
                XCTFail("We should have sucessfully sent this")
            }
            expectation.fulfill()
        })
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.mockReachabilityChecker.hasNetworkConnection = true
        }
        wait(for: [expectation], timeout: 0.02)
    }

    func test_logEvent_addsItemsToQueue() {
        let expectation = XCTestExpectation(description: "Item was added to queue")
        let testEvent = AnalyticEvent(type: "We", action: "Want", version: "Your")
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
        test_logEvent_delaysSingleItemUntilConnected()
        XCTAssertEqual(mockQueue.receivedQueueActions.first, .doNothing)
        XCTAssertEqual(mockQueue.receivedQueueActions.last, .removeFirst)
    }

    func test_logEvent_willContinueWhenGivenMoreItems() {
        test_init_sendsItemsFromStorage()
        mockEventSending.eventsLogged = []
        test_logEvent_sendsSingleItem()
    }
}

private class MockQueue<T: Codable & Identifiable>: QueueProviding {

    var next: Result<QueueItem<T>, QueueRetreivalError> { getNext() }
    var count: Int { underlyingStorage.count }
    var isEmpty: Bool { underlyingStorage.isEmpty }
    var queueWasEmptiedExpectation: XCTestExpectation?
    var addedToQueueExpectation: XCTestExpectation?

    var underlyingStorage: [T] = [] {
        didSet {
            guard underlyingStorage.isEmpty else { return }
            queueWasEmptiedExpectation?.fulfill()
        }
    }
    var receivedQueueActions: [QueueAction] = []

    func getNext() -> Result<QueueItem<T>, QueueRetreivalError> {
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

    func addToQueue(_ item: T) {
        underlyingStorage.append(item)
        addedToQueueExpectation?.fulfill()
    }
}
