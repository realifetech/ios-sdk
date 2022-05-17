//
//  GraphQLInterceptorProviderTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class GraphQLInterceptorProviderTests: XCTestCase {

    func test_interceptors_numbersAndSequenceAreCorrect() {
        let sut = GraphQLInterceptorProvider(
            store: ApolloStore(),
            client: MockURLSessionClient(),
            tokenHelper: EmptyTokenManager())
        let interceptors = sut.interceptors(for: ApolloType.GetFulfilmentPointsQuery(pageSize: 10, params: nil))
        XCTAssertEqual(interceptors.count, 8)
        XCTAssertTrue(interceptors[0] is APITokenInterceptor)
        XCTAssertTrue(interceptors[1] is MaxRetryInterceptor)
        XCTAssertTrue(interceptors[2] is CacheReadInterceptor)
        XCTAssertTrue(interceptors[3] is NetworkFetchInterceptor)
        XCTAssertTrue(interceptors[4] is RequestLoggingInterceptor)
        XCTAssertTrue(interceptors[5] is ResponseInterceptor)
        XCTAssertTrue(interceptors[6] is JSONResponseParsingInterceptor)
        XCTAssertTrue(interceptors[7] is CacheWriteInterceptor)
    }
}

private final class MockURLSessionClient: URLSessionClient { }
