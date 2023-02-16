//
//  AcceptLanguageHeaderRequestInsertingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 18/10/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class AcceptLanguageHeaderRequestInsertingTests: XCTestCase {

    func test_requstContainsLanguageHeader() {
        var request = URLRequest(url: URL(string: "www.test.com")!)
        request = MockAPIRequester.addLanguageHeader(toRequest: request)
        XCTAssertNotNil(request.allHTTPHeaderFields?["Accept-Language"])
    }
}

private struct MockAPIRequester: AcceptLanguageHeaderRequestInserting { }
