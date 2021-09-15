//
//  RequestTimeLoggerTests.swift
//  CLArenaTests
//
//  Created by Ross Patman on 11/06/2019.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class RequestTimeLoggerTests: XCTestCase {

    private var sut: RequestTimeLogger!
    private let queue = DispatchQueue(label: "RequestTimeLoggerTests")

    override func setUp() {
        super.setUp()
        sut = RequestTimeLogger(queue: queue)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_addRequests_addMultipleUniqueIdentifiers_returnsCorrectCount() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSince1970: 0))
        sut.addRequest(withIdentifier: "bbb", andDate: Date(timeIntervalSince1970: 0))
        queue.sync { } // A trick to make async behaviour to sync
        XCTAssertEqual(sut.requestEntries.count, 2)
        let comparableKeys = Array(sut.requestEntries.keys)
        XCTAssertTrue(comparableKeys.contains("aaa"))
        XCTAssertTrue(comparableKeys.contains("bbb"))
    }

    func test_addRequests_addMultipleSameIdentifiers_returnsCorrectCount() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSince1970: 0))
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSince1970: 1))
        queue.sync { }
        XCTAssertEqual(sut.requestEntries.count, 1)
        XCTAssertEqual(sut.requestEntries.first?.key, "aaa")
        XCTAssertEqual(sut.requestEntries.first?.value, Date(timeIntervalSince1970: 1))
    }

    func test_removeRequest() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSince1970: 0))
        sut.removeRequest(withIdentifier: "aaa")
        queue.sync { }
        XCTAssertTrue(sut.requestEntries.isEmpty)
    }

    func test_containsSlowRequestsAndRemove_noRequestsInEntries_shouldReturnFalse() {
        queue.sync { }
        XCTAssertFalse(sut.containsSlowRequestsAndRemove())
    }

    func test_containsSlowRequestsAndRemove_hasSlowRequestOnlyInEntries_shouldReturnTrue() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSinceNow: -3600))
        queue.sync { }
        XCTAssertTrue(sut.containsSlowRequestsAndRemove())
        queue.sync { }
        XCTAssertTrue(sut.requestEntries.isEmpty)
    }

    func test_containsSlowRequestsAndRemove_containsSlowAndFastRequestsInEntries_shouldReturnTrue() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSinceNow: -3600))
        sut.addRequest(withIdentifier: "bbb", andDate: Date(timeIntervalSinceNow: 1))
        queue.sync { }
        XCTAssertTrue(sut.containsSlowRequestsAndRemove())
        queue.sync { }
        XCTAssertEqual(sut.requestEntries.first?.key, "bbb")
    }

    func test_containsSlowRequestsAndRemove_hasFastRequestOnlyInEntries_shouldReturnFalse() {
        sut.addRequest(withIdentifier: "aaa", andDate: Date(timeIntervalSinceNow: 1))
        queue.sync { }
        XCTAssertFalse(sut.containsSlowRequestsAndRemove())
        queue.sync { }
        XCTAssertEqual(sut.requestEntries.first?.key, "aaa")
    }
}
