//
//  GraphNetworkCachePolicyTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class GraphNetworkCachePolicyTests: XCTestCase {

    func test_apolloCachePolicyType_mapsToCorrectType() {
        XCTAssertEqual(
            GraphNetworkCachePolicy.returnCacheDataElseFetch.apolloCachePolicyType,
            CachePolicy.returnCacheDataElseFetch)
        XCTAssertEqual(
            GraphNetworkCachePolicy.fetchIgnoringCacheData.apolloCachePolicyType,
            CachePolicy.fetchIgnoringCacheData)
        XCTAssertEqual(
            GraphNetworkCachePolicy.fetchIgnoringCacheCompletely.apolloCachePolicyType,
            CachePolicy.fetchIgnoringCacheCompletely)
        XCTAssertEqual(
            GraphNetworkCachePolicy.returnCacheDataDontFetch.apolloCachePolicyType,
            CachePolicy.returnCacheDataDontFetch)
        XCTAssertEqual(
            GraphNetworkCachePolicy.returnCacheDataAndFetch.apolloCachePolicyType,
            CachePolicy.returnCacheDataAndFetch)
    }
}
