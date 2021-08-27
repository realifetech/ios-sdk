//
//  DiskCacheDataProvidingErrorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class DiskCacheDataProvidingErrorTests: XCTestCase {

    func test_errorDescription() {
        let cases: [(DiskCacheDataProvidingError, String)] = [
            (.directoryNotFound, "DIRECTORY_NOTFOUND_ERROR".coreLocalizedString),
            (.unparseable, "UNPARSEABLE_ERROR".coreLocalizedString)
        ]
        cases.forEach {
            XCTAssertEqual($0.0.errorDescription, $0.1)
        }
    }
}
