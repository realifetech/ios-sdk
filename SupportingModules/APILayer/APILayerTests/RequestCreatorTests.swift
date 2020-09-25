//
//  RequestCreatorTests.swift
//  CLArenaTests
//
//  Created by apple on 24/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import XCTest
@testable import APILayer

class RequestCreatorTests: XCTestCase {

    func testGetParametersWithArray() {
        let testBody = ["userActions[]": ["scheduled", "interested", "going"]]
        let getParameters = RequestCreator.addGETParameters(fromBody: testBody)
        XCTAssertEqual(getParameters, "?userActions[]=scheduled&userActions[]=interested&userActions[]=going&")
    }

    func testGETSingleParameters() {
        let testBody = ["forceApiCheck": 1]
        let getParameters = RequestCreator.addGETParameters(fromBody: testBody)
        XCTAssertEqual(getParameters, "?forceApiCheck=1&")
    }

    func testGETMultipleParameters() {
        let testBody: [String: Any] = ["forceApiCheck": 1, "pageSize": 50, "testParameter": "test"]
        let getParameters = RequestCreator.addGETParameters(fromBody: testBody)
        XCTAssert(getParameters.contains("forceApiCheck=1"))
        XCTAssert(getParameters.contains("pageSize=50"))
        XCTAssert(getParameters.contains("testParameter=test"))
    }

    func testGETMultipleParametersDifferentOrder() {
        let testBody1: [String: Any] = ["forceApiCheck": 1, "pageSize": 50, "testParameter": "test", "userActions[]": ["scheduled", "going", "calendar", "interested"]]
        let testBody2: [String: Any] = ["pageSize": 50, "forceApiCheck": 1, "testParameter": "test", "userActions[]": ["scheduled", "going", "calendar", "interested"]]
        XCTAssertEqual(RequestCreator.addGETParameters(fromBody: testBody1), RequestCreator.addGETParameters(fromBody: testBody2))
    }
}
