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

    func test_evaluate_noWebView_detailsSaved_laterCalled() {
        let sut = OrderingJourneyViewUpdater()
        sut.evaluate(javascript: "abc", reloadOnSuccess: true) { _, _ in
            print("Done")
        }
        XCTAssertEqual(sut.javascriptRunDetails?.javascript, "abc")
        XCTAssertNotNil(sut.javascriptRunDetails?.completion)
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        XCTAssertEqual(oJV.javascriptEvaluated?.javascript, "abc")
        XCTAssertTrue(oJV.javascriptEvaluated?.reloadOnSuccess ?? false)
    }

    func test_evaluate_webView_evaluateCalled() {
        let sut = OrderingJourneyViewUpdater()
        let oJV = MockOJView()
        sut.orderingJourneyView = oJV
        sut.evaluate(javascript: "abc", reloadOnSuccess: false, completion: nil)
        XCTAssertEqual(oJV.javascriptEvaluated?.javascript, "abc")
        XCTAssertFalse(oJV.javascriptEvaluated?.reloadOnSuccess ?? true)
    }
}

private final class MockOJView: OrderingJourneyViewUpdatable {

    var javascriptEvaluated: JavascriptRunDetails?
    var reloadCalled = false
    var shouldFailEvaluation = false

    func evaluate(javascriptRunDetails: JavascriptRunDetails) {
        javascriptEvaluated = javascriptRunDetails
        javascriptRunDetails.completion?(nil, shouldFailEvaluation ? DummyError.failure : nil)
    }

    func reload() { }
}
