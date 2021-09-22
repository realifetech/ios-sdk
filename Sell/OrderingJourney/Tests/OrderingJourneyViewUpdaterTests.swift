//
//  OrderingJourneyViewUpdaterTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 22/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class OrderingJourneyViewUpdaterTests: XCTestCase {

    func test_evaluate_reloadCalled_shouldReload() {
        let sut = OrderingJourneyViewUpdater()
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        let expectation = XCTestExpectation()
        sut.evaluate(javascript: "abc", reloadOnSuccess: true) { _, _ in
            XCTAssertTrue(oJV.reloadCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_evaluate_reloadNotCalled_shouldNotReload() {
        let sut = OrderingJourneyViewUpdater()
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        let expectation = XCTestExpectation()
        sut.evaluate(javascript: "abc", reloadOnSuccess: false) { _, _ in
            XCTAssertFalse(oJV.reloadCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_evaluate_reloadNotCalled_shouldReload_evaluationFailed() {
        let sut = OrderingJourneyViewUpdater()
        let oJV = MockOJView()
        oJV.shouldFailEvaluation = true
        sut.orderingJourneyView = oJV
        let expectation = XCTestExpectation()
        sut.evaluate(javascript: "abc", reloadOnSuccess: false) { _, _ in
            XCTAssertFalse(oJV.reloadCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_evaluate_noWebView_detailsSaved_laterCalled() {
        let sut = OrderingJourneyViewUpdater()
        sut.evaluate(javascript: "abc", reloadOnSuccess: true) { _, _ in
            print("Done")
        }
        XCTAssertEqual(sut.javascriptToEvaluate, "abc")
        XCTAssertNotNil(sut.completionToFireAfterEvaluation)
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        XCTAssertEqual(oJV.javascriptEvaluated, "abc")
    }

    func test_evaluate_webView_evaluateCalled() {
        let sut = OrderingJourneyViewUpdater()
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        sut.evaluate(javascript: "abc", reloadOnSuccess: true, completion: nil)
        XCTAssertEqual(oJV.javascriptEvaluated, "abc")
    }
}

private final class MockOJView: OrderingJourneyViewUpdatable {

    var javascriptEvaluated: String?
    var reloadCalled = false
    var shouldFailEvaluation = false

    func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        javascriptEvaluated = javascript
        completion?(nil, shouldFailEvaluation ? DummyError.failure : nil)
    }

    func reload() {
        reloadCalled = true
    }
}
