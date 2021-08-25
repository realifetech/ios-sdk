//
//  ProductModifierItemSelectionInputTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class ProductModifierItemSelectionInputTests: XCTestCase {

    func test_publicInitialiser() {
        let sut = ProductModifierItemSelectionInput(productModifierItemId: "1", quantity: 1)
        XCTAssertEqual(sut.productModifierItemId, "1")
        XCTAssertEqual(sut.quantity, 1)
    }
}
