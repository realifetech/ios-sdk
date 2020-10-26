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

//    func test_init_successful() {
//        let spy = MockGraphQLDispatcher()
//        let sut = AnalyticsImplementing(dispatcher: spy)
//        XCTAssertNotNil(sut.dispatcher)
//    }
//
//    func test_init_failed() {
//        let spy = MockGraphQLDispatcher()
//        let sut = AnalyticsImplementing(dispatcher: spy)
//        XCTAssertNil(sut.dispatcher)
//    }
//
//    func test_deviceIsMemberOfAudience_isCalled() {
//        let spy = MockGraphQLDispatcher()
//        let sut = AnalyticsImplementing(dispatcher: spy)
//        let logEvent = AnalyticsEvent(type: "", action: "", new: nil, old: nil, version: "")
//        sut.logEvent(logEvent, completion: { _ in })
//        XCTAssertNotNil(sut.dispatcher)
//        XCTAssertTrue(spy.dispatchMutationIsCalled)
//    }

    // Mocks

    private class MockGraphQLDispatcher: GraphQLDispatching, LogEventSending {

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

        func logEvent(_ event: AnalyticsEvent, completion: @escaping (Result<Void, Error>) -> Void) {
        }
    }
}
