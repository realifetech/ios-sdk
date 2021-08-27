//
//  PersistentQueueTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class PersistentQueueTests: XCTestCase {

    private var sut: PersistentQueue<StubQueue>!
    private var storage: MockStorage!

    override func setUp() {
        super.setUp()
        storage = MockStorage()
        sut = PersistentQueue<StubQueue>(name: "sut", storage: storage)
    }

    override func tearDown() {
        sut = nil
        storage = nil
        super.tearDown()
    }

    func test_next_notLockedAndQueueIsNotEmpty_returnSuccess() {
        guard case let .success(nextItem) = sut.next else {
            return XCTFail("Should go with success")
        }
        XCTAssertEqual(nextItem.item.uniqueId, uuid)
    }

    func test_next_locked_returnLockedError() {
        test_next_notLockedAndQueueIsNotEmpty_returnSuccess()
        guard case let .failure(error) = sut.next else {
            return XCTFail("Should go with failure")
        }
        XCTAssertEqual(error, .queueIsLocked)
    }

    func test_next_notLockedAndQueueIsEmpty_returnEmptyError() {
        storage.hasQueue = false
        sut = PersistentQueue<StubQueue>(name: "sut", storage: storage)
        guard case let .failure(error) = sut.next else {
            return XCTFail("Should go with failure")
        }
        XCTAssertEqual(error, .empty)
    }

    func test_addToQueue() {
        let queue = StubQueue()
        sut.addToQueue(queue)
        XCTAssertEqual(storage.savedKey, queue.uniqueId.uuidString)
        XCTAssertEqual(sut.count, 2)
        XCTAssertFalse(sut.isEmpty)
    }
}

private let uuid = UUID()

private struct StubQueue: Codable, Identifiable {
    var uniqueId: UUID { uuid }
}

private final class MockStorage: Storeable {

    var hasQueue = true
    var savedKey: String?

    func fetchAll<Model: Decodable>() throws -> [Model] {
        return hasQueue
            ? ([StubQueue()] as? [Model]) ?? []
            : []
    }

    func fetch<Model: Decodable>(for key: String) throws -> Model {
        try XCTUnwrap(StubQueue() as? Model)
    }

    func save<Model: Encodable>(_ value: Model, for key: String) throws {
        savedKey = key
    }

    func delete(key: String) { }
}
