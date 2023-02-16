//
//  LanguageIdCreatorTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2023/2/10.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class LanguageIdCreatorTests: XCTestCase {

    func test_getLanguageId_whenLanguageIdContainsRegionCode_returnPrefixTwo() {
        let sut = LanguageIdCreator()
        let languageId = sut.getLanguageId(preferredLanguages: ["en-GB", "us", "de-de"])
        XCTAssertEqual(languageId, "en")
        let languageId2 = sut.getLanguageId(preferredLanguages: ["fr-CA", "en-US"])
        XCTAssertEqual(languageId2, "fr")
    }
}
