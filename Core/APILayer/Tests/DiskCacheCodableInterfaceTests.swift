//
//  DiskCacheCodableInterfaceTests.swift
//  RealifeTech-CoreSDKTests
//
//  Created by Mickey Lee on 05/03/2021.
//

import XCTest
@testable import RealifeTech

final class DiskCacheCodableInterfaceTests: XCTestCase {

    private var diskCache: MockDiskCache!
    private var sut: DiskCacheCodableInterface!

    private let fileName = "test_file"

    override func setUp() {
        super.setUp()
        diskCache = MockDiskCache()
        sut = DiskCacheCodableInterface(diskCache: diskCache)
    }

    override func tearDown() {
        sut = nil
        diskCache = nil
        super.tearDown()
    }

    func test_local_fileExists() {
        diskCache.shouldReturnedFile = true
        let reesult = sut.local(of: TestObject.self, fileName: fileName)
        XCTAssertEqual(diskCache.readFileName, fileName)
        XCTAssertEqual(reesult.object?.id, TestObject.local.id)
    }

    func test_local_fileDoesntExist() {
        let reesult = sut.local(of: TestObject.self, fileName: fileName)
        XCTAssertEqual(diskCache.readFileName, fileName)
        XCTAssertNil(reesult.object)
    }

    func test_localItems_filesExist() {
        diskCache.shouldReturnedFile = true
        let result = sut.localItems(of: TestObject.self, with: fileName)
        XCTAssertEqual(diskCache.readBaseFileName, fileName)
        XCTAssertEqual(result.first?.id, TestObject.local.id)
    }

    func test_localItems_filesDontExist() {
        let result = sut.localItems(of: TestObject.self, with: fileName)
        XCTAssertEqual(diskCache.readBaseFileName, fileName)
        XCTAssertTrue(result.isEmpty)
    }

    func test_save_canEncodeObject_savedFile() throws {
        try sut.save(TestObject.local, with: fileName)
        XCTAssertEqual(diskCache.savedFileName, fileName)
    }

    func test_decode_unparseable_throwError() throws {
        let raw = """
            {
                "invalid_id": 1
            }
        """
        let data = try XCTUnwrap(raw.data(using: .utf8))
        XCTAssertThrowsError(try sut.decode(data: data, to: TestObject.self, dateFormat: nil))
    }

    func test_decode_dateFormatIsNotNil() throws {
        let raw = """
            {
                "date": "2019-06-03T09:36:11+00:00"
            }
        """
        let format = "yyyy-MM-dd'T'HH:mm:ssZ"
        let locale = "en_US_POSIX"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: locale)
        let expectedDate = formatter.date(from: "2019-06-03T09:36:11+00:00")
        let data = try XCTUnwrap(raw.data(using: .utf8))
        let result = try sut.decode(
            data: data,
            to: DateObject.self,
            dateFormat: (format: format, localeIdentifier: locale))
        XCTAssertEqual(result.date, expectedDate)
    }
}

private struct DateObject: Codable {
    let date: Date
}
