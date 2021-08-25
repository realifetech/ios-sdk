//
//  ProductCategoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class ProductCategoryTests: XCTestCase {

    func test_initWithResponse_nilResponse_returnsNil() {
        XCTAssertNil(ProductCategory(response: nil))
    }
}
