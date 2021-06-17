//
//  SellFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class SellFactoryTests: XCTestCase {

    func test_makeSellModule_returnsSellImplementing() {
        let result = SellFactory.makeSellModule(graphQLManager: MockContentGraphQLManager())
        XCTAssertTrue(result is SellImplementing)
        XCTAssertTrue(result.product is ProductImplementing)
    }
}
