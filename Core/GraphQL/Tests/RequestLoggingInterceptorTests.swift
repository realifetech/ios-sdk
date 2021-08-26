//
//  RequestLoggingInterceptorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class RequestLoggingInterceptorTests: XCTestCase {

    private let operation = ApolloType.GetFulfilmentPointsQuery(pageSize: 10, params: nil)
    private var url: URL!
    private lazy var request = MockRequest<ApolloType.GetFulfilmentPointsQuery>(
        graphQLEndpoint: url,
        operation: operation,
        contentType: "",
        clientName: "",
        clientVersion: "",
        additionalHeaders: [:])

    override func setUpWithError() throws {
        try super.setUpWithError()
        url = URL(string: "localhost://")
    }

    override func tearDown() {
        url = nil
        super.tearDown()
    }

    func test_interceptAsync_shouldProceed() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let sut = RequestLoggingInterceptor()
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: nil
        ) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
}

private final class MockRequest<Operation: GraphQLOperation>: HTTPRequest<Operation> { }
