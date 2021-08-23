//
//  ProductFilterTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class ProductFilterTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = ProductFilter(fulfilmentPointIds: ["A"], categoriesIds: ["B"])
        XCTAssertEqual(sut.fulfilmentPointIds?.first, "A")
        XCTAssertEqual(sut.categoriesIds?.first, "B")
    }
}
