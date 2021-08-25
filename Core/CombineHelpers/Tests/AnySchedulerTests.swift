//
//  AnySchedulerTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 23/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Combine
@testable import RealifeTech

final class AnySchedulerTests: XCTestCase {

    private var bag: Set<AnyCancellable> = []

    func test_scheduleOptions() {
        let sut = DispatchQueueAnyScheduler.global()
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.schedule(options: nil) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_scheduleAfter() {
        let sut = DispatchQueueAnyScheduler.global()
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.schedule(
            after: sut.now.advanced(by: 0.001),
            tolerance: .zero,
            options: nil
        ) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_scheduleAfterCancellable() {
        let sut = DispatchQueueAnyScheduler.global()
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.schedule(
            after: sut.now.advanced(by: 0.001),
            interval: 0.001,
            tolerance: .zero,
            options: nil
        ) {
            expectation.fulfill()
        }.store(in: &bag)
        wait(for: [expectation], timeout: 0.01)
    }
}
