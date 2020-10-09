//
//  EmptyTokenManagerTests.swift
//  APIV3UtilitiesTests
//
//  Created by Olivier Butler on 09/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import APIV3Utilities

class EmptyTokenManagerTests: XCTestCase {

    func test_getValidToken() {
        let sut = EmptyTokenManager()
        var didExecuteCompletion: Bool = false
        sut.getValidToken {
            didExecuteCompletion = true
        }
        XCTAssertTrue(didExecuteCompletion)
    }
}
