//
//  AudiencesTests.swift
//  AudiencesTests
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import XCTest
@testable import RealifeTech
@testable import Apollo

class AudiencesTests: XCTestCase {

    func test_init_successful() {
        let spy = MockGraphQLDispatcher()
        let sut = AudiencesImplementing(dispatcher: spy)
        XCTAssertNotNil(sut.dispatcher)
    }

    func test_init_failed() {
        let spy = MockGraphQLDispatcher()
        let sut = AudiencesImplementing(dispatcher: spy)
        XCTAssertNil(sut.dispatcher)
    }

    func test_deviceIsMemberOfAudience_isCalled() {
        let spy = MockGraphQLDispatcher()
        let sut = AudiencesImplementing(dispatcher: spy)
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
