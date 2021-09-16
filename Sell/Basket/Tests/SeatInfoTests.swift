//
//  SeatInfoTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 15/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class SeatInfoTests: XCTestCase {

    func test_initWithJson_nilJson_returnsNil() {
        XCTAssertNil(SeatInfo(json: nil))
    }

    func test_initWithJson_nonNilJsonWithMatchedProperties_returnsSeatInfo() throws {
        let json: [[String: String?]] = [[
            "row": "A",
            "seat": "B",
            "block": "C",
            "table": "D"
        ]]
        let sut = try XCTUnwrap(SeatInfo(json: json))
        XCTAssertEqual(sut.row, "A")
        XCTAssertEqual(sut.seat, "B")
        XCTAssertEqual(sut.block, "C")
        XCTAssertEqual(sut.table, "D")
    }

    func test_initWithJson_nonNilJsonWithMismatchedProperties_returnsSeatInfoWithNilProperties() throws {
        let json: [[String: String?]] = [[
            "a": "A",
            "b": "B",
            "c": "C",
            "d": "D"
        ]]
        let sut = try XCTUnwrap(SeatInfo(json: json))
        XCTAssertNil(sut.row)
        XCTAssertNil(sut.seat)
        XCTAssertNil(sut.block)
        XCTAssertNil(sut.table)
    }

    func test_initWithJsonValue_DictionaryType_returnsSeatInfo() throws {
        let jsonValueDict: [String: String?] = [
            "row": "A",
            "seat": "B",
            "block": "C",
            "table": "D"
        ]
        let json = try JSON(jsonValue: jsonValueDict)
        let sut = try XCTUnwrap(SeatInfo(json: json))
        XCTAssertEqual(sut.row, "A")
        XCTAssertEqual(sut.seat, "B")
        XCTAssertEqual(sut.block, "C")
        XCTAssertEqual(sut.table, "D")
    }

    func test_initWithJSONValue_ArrayType_returnsSeatInfo() throws {
        let jsonValueArray: [[String: String?]] = [[
            "row": "A",
            "seat": "B",
            "block": "C",
            "table": "D"
        ]]
        let json = try JSON(jsonValue: jsonValueArray)
        let sut = try XCTUnwrap(SeatInfo(json: json))
        XCTAssertEqual(sut.row, "A")
        XCTAssertEqual(sut.seat, "B")
        XCTAssertEqual(sut.block, "C")
        XCTAssertEqual(sut.table, "D")
    }

    func test_initWithJsonValue_notArrayOrDictionayType_returnsError() throws {
        let jsonValueString = "a"
        do {
            let json = try JSON(jsonValue: jsonValueString)
            XCTAssertNil(SeatInfo(json: json))
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
}
