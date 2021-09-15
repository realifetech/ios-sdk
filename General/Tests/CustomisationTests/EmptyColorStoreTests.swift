//
//  EmptyColorStoreTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import SwiftUI
@testable import RealifeTech

final class EmptyColorStoreTests: XCTestCase {

    private var sut: EmptyColorStore!

    override func setUp() {
        super.setUp()
        sut = EmptyColorStore()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_setColor_setDifferentTypes_setIsUpdated() throws {
        sut.setColor(.black, for: .primary)
        sut.setColor(.blue, for: .onPrimary)
        XCTAssertEqual(sut.colors.count, 2)
        let primaryColor = try XCTUnwrap(sut.colors.first { $0.type == .primary }?.color)
        XCTAssertEqual(primaryColor, .black)
        let onPrimaryColor = try XCTUnwrap(sut.colors.first { $0.type == .onPrimary }?.color)
        XCTAssertEqual(onPrimaryColor, .blue)
    }

    func test_setColor_setSameType_setIsUpdated() throws {
        sut.setColor(.black, for: .primary)
        sut.setColor(.red, for: .primary)
        XCTAssertEqual(sut.colors.count, 1)
        let primaryColor = try XCTUnwrap(sut.colors.first { $0.type == .primary }?.color)
        XCTAssertEqual(primaryColor, .red)
    }

    func test_getColor_typeFound_returnsColor() throws {
        try test_setColor_setDifferentTypes_setIsUpdated()
        XCTAssertEqual(sut.getColor(for: .primary), Color(.black))
    }

    func test_getColor_typeNotFound_returnsColor() throws {
        try test_setColor_setDifferentTypes_setIsUpdated()
        XCTAssertEqual(sut.getColor(for: .neutral), Color(.clear))
    }
}
