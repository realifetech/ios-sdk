//
//  ContentImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import RealifeTech_CoreSDK
import Apollo
@testable import RealifeTech

final class ContentImplementingTests: XCTestCase {

    private var dispatcher: MockGraphQLDispatcher!
    private var sut: ContentImplementing!

    override func setUp() {
        super.setUp()
        dispatcher = MockGraphQLDispatcher()
        sut = ContentImplementing(dispatcher: dispatcher)
    }

    override func tearDown() {
        sut = nil
        dispatcher = nil
        super.tearDown()
    }

    func test_getWebPage_queryReturnsValidUrl_completeWithWebPage() {
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .success(webPage) = result else {
                return XCTFail("This test should return success case")
            }
            XCTAssertEqual(webPage.url.absoluteString, dummyUrl)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsNilUrl_completeWithEmptyError() {
        dispatcher.shouldReturnNilUrl = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual((error as? ContentError), ContentError.urlIsEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsInvalidUrl_completeWithConstructionUrlFailureError() {
        dispatcher.shouldReturnConstructionError = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual((error as? ContentError), ContentError.constructUrlFailure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsNormalError_completeWithNormalError() {
        dispatcher.shouldReturnNormalError = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual((error as? DummyError), DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

// MARK: - Mocks

private let dummyUrl = "https://www.google.com"

enum DummyError: Error {
    case failure
}

private final class MockGraphQLDispatcher: GraphQLDispatching {

    var shouldReturnNormalError = false
    var shouldReturnNilUrl = false
    var shouldReturnConstructionError = false

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) {
        if shouldReturnNormalError {
            completion(.failure(DummyError.failure))
        } else {
            let url = shouldReturnConstructionError ? "" : dummyUrl
            let getWebPageType = ApolloType.GetWebPageByTypeQuery.Data.GetWebPageByType(url: url)
            let data = ApolloType.GetWebPageByTypeQuery.Data(
                getWebPageByType: shouldReturnNilUrl ? nil : getWebPageType)
            let result = GraphQLResult<Query.Data>(
                data: data as? Query.Data,
                extensions: nil,
                errors: nil,
                source: .cache,
                dependentKeys: nil)
            completion(.success(result))
        }
    }

    func dispatchMutation<Query: GraphQLMutation>(
        mutation: Query,
        completion:  @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }
}
