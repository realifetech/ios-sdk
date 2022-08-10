//
//  OrderingJourneyViewModelTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 19/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class OrderingJourneyViewModelTests: XCTestCase {

    private var sut: OrderingJourneyViewModel!

    override func setUp() {
        super.setUp()
        sut = OrderingJourneyViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_updateCanGoBackWithTrue_canGoBackReturnsTrue() {
        sut.updateCanGoBack(with: true)
        XCTAssertTrue(sut.canGoBack)
    }

    func test_updateCanGoBackWithFalse_canGoBackReturnsFalse() {
        sut.updateCanGoBack(with: false)
        XCTAssertFalse(sut.canGoBack)
    }

    func test_updateCanGoForwardWithTrue_canGoForwardReturnsTrue() {
        sut.updateCanGoForward(with: true)
        XCTAssertTrue(sut.canGoForward)
    }

    func test_updateCanGoForwardWithFalse_canGoForwardReturnsFalse() {
        sut.updateCanGoForward(with: false)
        XCTAssertFalse(sut.canGoForward)
    }
}
