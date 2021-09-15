//
//  IdentityImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 14/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class IdentityImplementingTests: XCTestCase {

    private var sut: IdentityImplementing!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let sell = IdentityFactory.makeIdentityModule()
        sut = try XCTUnwrap(sell as? IdentityImplementing)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_isHostAppLoginDeepLink_true() {
        XCTAssertTrue(sut.isHostAppLoginDeepLink(url: URL(string: "deeplinkscheme://rlthostapplogin")))
    }

    func test_isHostAppLoginDeepLink_false() {
        XCTAssertFalse(sut.isHostAppLoginDeepLink(url: URL(string: "deeplinkscheme://someotherdeeplink")))
    }
}
