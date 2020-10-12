//
//  Dictionary+ExtensionsTests.swift
//  APIV3UtilitiesTests
//
//  Created by Olivier Butler on 09/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import APIV3Utilities

class DictionaryExtensionsTests: XCTestCase {

    func test_dictionaryRemovingNilValuesFromDictionary() {
        let testDict = [
            "hello": 123,
            "my": nil,
            "name": 345,
            "is": nil,
            "terry": nil
        ]
        let result = dictionaryRemovingNilValuesFromDictionary(testDict as [String : AnyObject?])
        result.enumerated().forEach({
            XCTAssertNotNil($0.1)
        })
        XCTAssertEqual(result["hello"] as? Int, testDict["hello"])
        XCTAssertEqual(result["name"] as? Int, testDict["name"])
    }
}
