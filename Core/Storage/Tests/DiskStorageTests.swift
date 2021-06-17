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
    private var writeSut: DiskStorage!
    private var readSut: DiskStorage!

    override func setUp() {
        super.setUp()
        writeSut = makeSut()
        readSut = makeSut()
    }

    override func tearDown() {
        writeSut.deleteValue(for: "diskStorageData")
        writeSut = nil
        readSut = nil
        super.tearDown()
    }

    func test_saveValue() throws {
        let currentDate = Date()
        let object = TestObject(name: "diskStorageData", date: currentDate)
        let encodedObject = try JSONEncoder.init().encode(object)
        try writeSut.save(value: encodedObject, for: "diskStorageData")
    }

    func test_saveValue_withHandler() {
        writeSut.save(value: testData, for: "diskStorageData", handler: { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }

    func test_deleteValue() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        writeSut.deleteValue(for: "diskStorageData")
        XCTAssertThrowsError(try readSut.fetchValue(for: "diskStorageData"))
    }

    func test_fetchValues() throws {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        let dataArray = try readSut.fetchValues(with: "diskStorageData")
        XCTAssertEqual(dataArray.count, 1)
    }

    func test_fetchValues_isEmpty() {
        XCTAssertThrowsError(try readSut.fetchValues(with: "falseStorageData"))
    }

    func test_fetchValue() throws {
        let currentDate = Date()
        let object = TestObject(name: "diskStorageData", date: currentDate)
        let encodedObject = try JSONEncoder.init().encode(object)
        try writeSut.save(value: encodedObject, for: "diskStorageData")
        let objectData = try readSut.fetchValue(for: "diskStorageData")
        let decodedObject = try JSONDecoder.init().decode(TestObject.self, from: objectData)
        XCTAssertEqual(decodedObject.name, "diskStorageData")
        XCTAssertEqual(decodedObject.date, currentDate)
    }

    func test_fetchValue_withHandler() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        readSut.fetchValue(for: "diskStorageData") { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    private func makeSut() -> DiskStorage {
        let path = URL(fileURLWithPath: NSTemporaryDirectory())
        return DiskStorage(path: path)
    }
}
