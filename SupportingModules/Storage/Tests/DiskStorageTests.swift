//
//  DiskStorageTests.swift
//  RealifeTechTests
//
//  Created by Jonathon Albert on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class DiskStorageTests: XCTestCase {

    let testData = Data()
    let writeSut: DiskStorage = makeSut()
    let readSut: DiskStorage = makeSut()

    override func setUp() {
        writeSut.deleteValue(for: "diskStorageData")
    }

    override func tearDown() {
        writeSut.deleteValue(for: "diskStorageData")
    }

    func test_saveValue() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        writeSut.deleteValue(for: "diskStorageData")
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

    func test_fetchValues() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        do {
            let dataArray = try readSut.fetchValues(with: "diskStorageData")
            XCTAssertEqual(dataArray.count, 1)
        } catch {
            XCTFail("Failed to fetch data")
        }
    }

    func test_fetchValues_isEmpty() {
        XCTAssertThrowsError(try readSut.fetchValues(with: "falseStorageData"))
    }

    func test_fetchValue() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        XCTAssertNoThrow(try readSut.fetchValue(for: "diskStorageData"))
    }

    func test_fetchValue_withHandler() {
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        readSut.fetchValue(for: "diskStorageData", handler: { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }

    private class func makeSut() -> DiskStorage {
        let path = URL(fileURLWithPath: NSTemporaryDirectory())
        return DiskStorage(path: path)
    }
}