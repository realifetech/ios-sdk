//
//  FilterParamTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class FilterParamTests: XCTestCase {

    func test_apolloType() {
        let sut = FilterParam(key: "A", value: "B")
        XCTAssertEqual(sut.apolloType.key, sut.key)
        XCTAssertEqual(sut.apolloType.value, sut.value)
    }
}
