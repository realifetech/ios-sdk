//
//  UserDefaultsStorageTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class UserDefaultsStorageTests: XCTestCase {

    private var sut: UserDefaultsStorage!
    private var userDefaults: MockUserDefaults!

    private let queue = DispatchQueue(label: String(describing: UserDefaultsStorageTests.self))

    override func setUp() {
        super.setUp()
        userDefaults = MockUserDefaults()
        sut = UserDefaultsStorage(userDefaults: userDefaults, dispatchQueue: queue)
    }

    override func tearDown() {
        sut = nil
        userDefaults = nil
        super.tearDown()
    }

    func test_fetchValuesWithPrefix_valuesFoundFromTheStorage() throws {
        let storage = try makeStorage()
        userDefaults.dictionaryRepresentationReturns = storage
        let result = try sut.fetchValues(with: "key")
        XCTAssertEqual(result.count, storage.count)
    }

    func test_fetchValuesWithPrefix_valuesNotFoune() throws {
        let storage = try makeStorage()
        userDefaults.dictionaryRepresentationReturns = storage
        do {
            _ = try sut.fetchValues(with: "not-found")
        } catch {
            guard
                let error = error as? StorageError,
                case .notFound = error
            else {
                return XCTFail("Error should be StorageError type")
            }
        }
    }

    func test_fetchValueForKeyWithHandler_valuesFoundFromTheStorage() throws {
        let storage = try makeStorage()
        userDefaults.dictionaryRepresentationReturns = storage
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.fetchValue(for: "key1") { result in
            guard case let .success(data) = result else {
                return XCTFail("Should go with success")
            }
            XCTAssertEqual(data, storage["key1"])
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_fetchValueForKeyWithHandler_valuesNotFound() throws {
        let storage = try makeStorage()
        userDefaults.dictionaryRepresentationReturns = storage
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.fetchValue(for: "not-found") { result in
            guard
                case let .failure(error) = result,
                let storageError = error as? StorageError,
                case .notFound = storageError
            else {
                return XCTFail("Should go with failure")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_saveValue() throws {
        try sut.save(value: Data(), for: "test")
        XCTAssertEqual(userDefaults.savedKey, "test")
    }

    func test_saveValueWithHandler() {
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.save(value: Data(), for: "test") { _ in
            XCTAssertEqual(self.userDefaults.savedKey, "test")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deleteValue() {
        sut.deleteValue(for: "test")
        XCTAssertEqual(userDefaults.removedKey, "test")
    }

    private func makeStorage() throws -> [String: Data] {
        let key1: (String, Data) = ("key1", try XCTUnwrap("key1".data(using: .utf8)))
        let key2: (String, Data) = ("key2", try XCTUnwrap("key2".data(using: .utf8)))
        return [
            key1.0: key1.1,
            key2.0: key2.1
        ]
    }
}

private final class MockUserDefaults: UserDefaults {

    var dictionaryRepresentationReturns: [String: Data]?
    var savedKey: String?
    var removedKey: String?

    override func dictionaryRepresentation() -> [String: Any] {
        dictionaryRepresentationReturns ?? [:]
    }

    override func data(forKey defaultName: String) -> Data? {
        dictionaryRepresentationReturns?[defaultName]
    }

    override func setValue(_ value: Any?, forKey key: String) {
        savedKey = key
    }

    override func removeObject(forKey defaultName: String) {
        removedKey = defaultName
    }
}
