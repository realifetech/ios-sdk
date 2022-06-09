//
//  RLTLinkHandlingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 09/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

class RLTLinkHandlingTests: XCTestCase {

    func test_generateLinkHandler() {
        let urlString = "https://google.com"
        var linkHandlerCalled = false
        let banner = RLTBanner(id: nil,
                               title: nil,
                               subtitle: nil,
                               imageUrl: nil,
                               language: nil,
                               url: urlString) {
            linkHandlerCalled = true
        }
        banner.generateLinkHandler { url in
            XCTAssertEqual(linkHandlerCalled, true)
            XCTAssertEqual(url.absoluteString, "https://google.com")
        }()
    }
}
