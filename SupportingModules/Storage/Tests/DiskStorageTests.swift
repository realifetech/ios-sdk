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

    let writeSut: DiskStorage = makeSut()
    let readSut: DiskStorage = makeSut()

    override func setUp() {
        writeSut.deleteValue(for: "diskStorageData")
    }

    override func tearDown() {
        writeSut.deleteValue(for: "diskStorageData")
    }

    func test_saveValue() {
        let testData = Data()
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        writeSut.deleteValue(for: "diskStorageData")
    }

    func test_saveValue_withHandler() {
        let testData = Data()
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
        let testData = Data()
        XCTAssertNoThrow(try writeSut.save(value: testData, for: "diskStorageData"))
        writeSut.deleteValue(for: "diskStorageData")
        XCTAssertThrowsError(try readSut.fetchValue(for: "diskStorageData"))
    }

    func test_fetchValues() {

    }

    func test_fetchValue() {

    }

    private class func makeSut() -> DiskStorage {
        let path = URL(fileURLWithPath: NSTemporaryDirectory())
        return DiskStorage(path: path)
    }
}
