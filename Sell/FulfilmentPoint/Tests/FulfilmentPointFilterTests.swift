//
//  FulfilmentPointFilterTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class FulfilmentPointFilterTests: XCTestCase {

    func test_apolloType() {
        let sut = FulfilmentPointFilter(categories: ["A"])
        XCTAssertEqual(sut.apolloType.categories, ["A"])
    }
}
