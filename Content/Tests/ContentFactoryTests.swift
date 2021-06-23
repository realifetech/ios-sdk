//
//  ContentFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class ContentFactoryTests: XCTestCase {

    func test_makeContentModule_setGraphQLDispatcher() {
        let graphQLManager = MockGraphQLManager<ContentQueryDataType>()
        let sut = ContentFactory.makeContentModule(graphQLManager: graphQLManager)
        XCTAssertTrue((sut as? ContentImplementing)?.graphQLManager is MockGraphQLManager<ContentQueryDataType>)
    }
}
