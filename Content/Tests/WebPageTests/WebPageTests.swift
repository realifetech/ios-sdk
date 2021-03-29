//
//  WebPageTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class WebPageTests: XCTestCase {

    func test_initWithValue_camelCasedValidValue_initSelf() {
        WebPageType.allCases.forEach { type in
            let result = WebPageType(value: type.rawValue)
            XCTAssertEqual(result, type)
        }
    }

    func test_initWithValue_lowercasedValidValue_initSelf() {
        WebPageType.allCases.forEach { type in
            let result = WebPageType(value: type.rawValue.lowercased())
            XCTAssertEqual(result, type)
        }
    }

    func test_initWithValue_mismatchValue_returnNil() {
        let result = WebPageType(value: "WRONG!")
        XCTAssertNil(result)
    }
}
