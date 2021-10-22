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

    func test_languageHeader_prefix() {
        XCTAssertEqual(MockAPIRequester.getLanguageId(preferredLanguages: ["en-GB", "us", "de-de"]), "en")
    }
}

private struct MockAPIRequester: AcceptLanguageHeaderRequestInserting { }
