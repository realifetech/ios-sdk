//
//  CodableStorageTests.swift
//  RealifeTechTests
//
//  Created by Jonathon Albert on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class CodableStorageTests: XCTestCase {

    struct TestObject: Codable {
        let name: String
        let date: Date
    }

    let sut = CodableStorageTests.makeSut()

    override func setUp() {
        super.setUp()
        do {
            let objects: [TestObject] = try sut.fetchAll()
            objects.forEach { object in
                sut.delete(key: object.name)
            }
        } catch {}
    }

    func test_fetchAll() {
        do {
            try Array(1...5).forEach({ index in
                let testObject: TestObject = TestObject(name: "testObj\(index)", date: Date())
                try sut.save(testObject, for: testObject.name)
            })
            let testObjects: [TestObject] = try sut.fetchAll()
            XCTAssertEqual(testObjects.count, 5)
        } catch let error {
            XCTFail("Failed with error: \(error.localizedDescription)")
        }
    }

    func test_singleFetch() {
        do {
            try Array(1...5).forEach({ index in
                let testObject: TestObject = TestObject(name: "testObj\(index)", date: Date())
                try sut.save(testObject, for: testObject.name)
            })
            let testObject: TestObject = try sut.fetch(for: "testObj3")
            XCTAssertNotNil(testObject)
        } catch let error {
            XCTFail("Failed with error: \(error.localizedDescription)")
        }
    }

    func test_saveValue() {
        let test = TestObject(name: "testObj", date: Date())
        do {
            try sut.save(test, for: test.name)
            let savedObject: TestObject = try sut.fetch(for: test.name)
            XCTAssertNotNil(savedObject)
        } catch {
            XCTFail("Failed to save object")
        }
    }

    static func makeSut() -> CodableStorage {
        let path = URL(fileURLWithPath: NSTemporaryDirectory())
        let sut = CodableStorage(storage: DiskStorage(path: path),
                                 storagePrefix: "test")
        return sut
    }
}
