//
//  ScreenTypeTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import GraphQL
@testable import RealifeTech

final class ScreenTypeTests: XCTestCase {

    func test_apolloType_validType() {
        let cases: [(ScreenType, ApolloType.ScreenType)] = [
            (.discover, .discover),
            (.shop, .shop),
            (.events, .events),
            (.wallet, .wallet),
            (.booking, .booking),
            (.lineup, .lineup),
            (.social, .social),
            (.generic, .generic)
        ]
        cases.forEach {
            XCTAssertEqual($0.0.apolloType, $0.1)
        }
    }
}
