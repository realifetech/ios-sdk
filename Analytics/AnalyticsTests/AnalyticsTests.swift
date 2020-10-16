//
//  AnalyticsTests.swift
//  AnalyticsTests
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech
@testable import Apollo

class AnalyticsTests: XCTestCase {

    func test_init_successful() {
        let sut = AnalyticsImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "www.google.com",
                                        deviceId: "")
        XCTAssertNotNil(sut.dispatcher)
    }

    func test_init_failed() {
        let sut = AnalyticsImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "",
                                        deviceId: "")
        XCTAssertNil(sut.dispatcher)
    }

    func test_deviceIsMemberOfAudience_isCalled() {
        let sut = AnalyticsImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "www.google.com",
                                        deviceId: "")
        let spy = MockGraphQLDispatcher()
        sut.dispatcher = spy
        sut.logEvent(type: "", action: "", new: nil, old: nil, completion: { _ in })
        XCTAssertNotNil(sut.dispatcher)
        XCTAssertTrue(spy.dispatchMutationIsCalled)
    }

    // Mocks

    private class MockGraphQLDispatcher: GraphQLDispatching {

        var shouldFail: Bool = false
        var dispatchMutationIsCalled: Bool = false

        func dispatch<T>(
            query: T,
            completion: @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
        ) where T: GraphQLQuery {}

        func dispatchMutation<T>(
            mutation: T,
            completion: @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
        ) where T: GraphQLMutation {
            dispatchMutationIsCalled = true
        }
    }
}
