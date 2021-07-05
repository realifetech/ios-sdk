//
//  CanvasFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class CanvasFactoryTests: XCTestCase {

    func test_makeCanvasModule() {
        let result = CanvasFactory.makeCanvasModule(graphQLManager: MockGraphQLManager<CanvasRepository>())
        XCTAssertTrue(result is CanvasRepository)
    }
}
