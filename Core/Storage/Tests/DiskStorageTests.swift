//
//  DiskStorageTests.swift
//  RealifeTechTests
//
//  Created by Jonathon Albert on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class DiskStorageTests: XCTestCase {

    private struct TestObject: Codable {
        let name: String
        let date: Date
    }

    private let testData = Data()
    private let url = URL(fileURLWithPath: NSTemporaryDirectory())
    private let key = "diskStorageData"

    private var fileManager: FileManagerSpy!
    private var sut: DiskStorage!

    override func setUp() {
        super.setUp()
        fileManager = FileManagerSpy()
        sut = DiskStorage(
            path: url,
            queue: DispatchQueue.global(),
            fileManager: fileManager)
    }

    override func tearDown() {
        sut.deleteValue(for: key)
        sut = nil
        fileManager = nil
        super.tearDown()
    }

    func test_saveValue_noExistingFolder_fileManagerCreateNewFolder() throws {
        try sut.save(value: Data(), for: key)
        XCTAssertTrue(fileManager.didCreateDirectory)
    }

    func test_saveValue_existingFolder_fileManagerNotCreateNewFolder() throws {
        fileManager.fileExistsReturns = true
        let currentDate = Date()
        let object = TestObject(name: key, date: currentDate)
        let encodedObject = try JSONEncoder.init().encode(object)
        try sut.save(value: encodedObject, for: key)
        XCTAssertFalse(fileManager.didCreateDirectory)
    }

    func test_saveValueWithHandler_executeInQueue() {
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.save(value: testData, for: key) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deleteValue_fileManagerRemovesItem() throws {
        sut.deleteValue(for: key)
        XCTAssertEqual(fileManager.removedPath, url.path + "/" + key)
    }

    func test_fetchValuesWithPrefix_hasData_returnNonEmptyArray() throws {
        try test_saveValue_noExistingFolder_fileManagerCreateNewFolder()
        fileManager.contentsOfDirectoryReturns = ["\(key)"]
        fileManager.contentsAtPathReturns = Data()
        let result = try sut.fetchValues(with: key)
        XCTAssertEqual(result.count, 1)
    }

    func test_fetchValuesWithPrefix_hasNoData_returnEmptyError() {
        XCTAssertThrowsError(try sut.fetchValues(with: key))
    }

    func test_fetchValueForKey_hasData_returnData() {
        fileManager.contentsAtPathReturns = Data()
        XCTAssertNoThrow(try sut.fetchValue(for: key))
    }

    func test_fetchValueForKey_hasNoData_returnNotFoundError() {
        XCTAssertThrowsError(try sut.fetchValue(for: key))
    }

    func test_fetchValueWithHandler_hasData_returnNonEmptyArray() {
        fileManager.contentsOfDirectoryReturns = ["test"]
        fileManager.contentsAtPathReturns = Data()
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.fetchValue(for: key) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_fetchValueWithHandler_hasNoData_returnError() {
        let expectation = XCTestExpectation(description: "handler is fulfilled")
        sut.fetchValue(for: key) { result in
            switch result {
            case .success:
                XCTFail("This test should be failure")
            case .failure:
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

private final class FileManagerSpy: FileManager {

    var fileExistsReturns = false
    var contentsOfDirectoryReturns: [String] = []
    var contentsAtPathReturns: Data?

    var didCreateDirectory = false
    var removedPath: String?

    override func fileExists(atPath path: String) -> Bool {
        fileExistsReturns
    }

    override func createDirectory(
        at url: URL,
        withIntermediateDirectories createIntermediates: Bool,
        attributes: [FileAttributeKey: Any]? = nil
    ) throws {
        didCreateDirectory = true
    }

    override func removeItem(atPath path: String) throws {
        removedPath = path
        try super.removeItem(atPath: path)
    }

    override func contentsOfDirectory(atPath path: String) throws -> [String] {
        contentsOfDirectoryReturns
    }

    override func contents(atPath path: String) -> Data? {
        contentsAtPathReturns
    }
}
