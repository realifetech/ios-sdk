//
//  GraphQLManagerErrorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class GraphQLManagerErrorTests: XCTestCase {

    func test_errorDescription_noDataError_returnsLocalizedString() {
        XCTAssertEqual(
            GraphQLManagerError.noDataError.errorDescription,
            "UNPARSEABLE_ERROR".coreLocalizedString)
    }
}
