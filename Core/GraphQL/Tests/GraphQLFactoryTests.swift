//
//  GraphQLFactoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class GraphQLFactoryTests: XCTestCase {

    func test_makeGraphQLManager_constructGraphQLManager() {
        let dummyUrl: URL! = URL(string: "https://google.com")
        let sut = GraphQLFactory.makeGraphQLManager(
            deviceId: "A",
            tokenHelper: EmptyTokenManager(),
            graphQLAPIUrl: dummyUrl)
        XCTAssertTrue(sut is GraphQLManager)
    }
}
