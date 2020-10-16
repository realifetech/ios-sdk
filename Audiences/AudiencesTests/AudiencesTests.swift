//
//  AudiencesTests.swift
//  AudiencesTests
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import XCTest
@testable import Audiences
@testable import APIV3Utilities
@testable import GraphQL
@testable import Apollo

class AudiencesTests: XCTestCase {

    func test_init_successful() {
        let sut = AudiencesImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "www.google.com",
                                        deviceId: "")
        XCTAssertNotNil(sut.dispatcher)
    }

    func test_init_failed() {
        let sut = AudiencesImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "",
                                        deviceId: "")
        XCTAssertNil(sut.dispatcher)
    }

    func test_deviceIsMemberOfAudience_isCalled() {
        let sut = AudiencesImplementing(tokenHelper: EmptyTokenManager(),
                                        graphQLAPIUrl: "www.google.com",
                                        deviceId: "")
        let spy = MockGraphQLDispatcher()
        sut.dispatcher = spy
        sut.deviceIsMemberOfAudience(audienceId: "") { _ in }
        XCTAssertNotNil(sut.dispatcher)
        XCTAssertTrue(spy.dispatchQueryIsCalled)
    }

    // Mocks

    private class MockGraphQLDispatcher: GraphQLDispatching {

        var shouldFail: Bool = false
        var dispatchQueryIsCalled: Bool = false

        func dispatch<T>(
            query: T,
            completion: @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
        ) where T: GraphQLQuery {
            dispatchQueryIsCalled = true
        }

        func dispatchMutation<T>(
            mutation: T,
            completion: @escaping (Result<GraphQLResult<T.Data>, Error>) -> Void
        ) where T: GraphQLMutation {}
    }
}
