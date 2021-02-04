//
//  AudiencesTests.swift
//  AudiencesTests
//
//  Created by Jonathon Albert on 07/10/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import XCTest
import RealifeTech_CoreSDK
@testable import RealifeTech
@testable import Apollo

final class AudiencesTests: XCTestCase {

    func test_init_successful() {
        let spy = MockGraphQLDispatcher()
        let sut = AudiencesImplementing(dispatcher: spy)
        XCTAssertNotNil(sut.dispatcher)
    }

    func test_deviceIsMemberOfAudience_isCalled() {
        let spy = MockGraphQLDispatcher()
        let sut = AudiencesImplementing(dispatcher: spy)
        sut.deviceIsMemberOfAudience(audienceId: "") { _ in }
        XCTAssertNotNil(sut.dispatcher)
        XCTAssertTrue(spy.dispatchQueryIsCalled)
    }

    // Mocks

    private final class MockGraphQLDispatcher: GraphQLDispatching {

        var shouldFail: Bool = false
        var dispatchQueryIsCalled: Bool = false

        func dispatch<Query: GraphQLQuery>(
            query: Query,
            cachePolicy: GraphNetworkCachePolicy,
            completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
        ) {
            dispatchQueryIsCalled = true
        }

        func dispatchMutation<Query: GraphQLMutation>(
            mutation: Query,
            completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
        ) {}
    }
}
