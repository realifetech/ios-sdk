//
//  ResponseInterceptorTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2022/5/17.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

class ResponseInterceptorTests: XCTestCase {

    private var sut: ResponseInterceptor!
    private var tokenHelper: MockTokenHelper!
    private var url: URL!

    private let operation = ApolloType.GetFulfilmentPointsQuery(pageSize: 10, params: nil)
    private lazy var request = MockRequest<ApolloType.GetFulfilmentPointsQuery>(
        graphQLEndpoint: url,
        operation: operation,
        contentType: "",
        clientName: "",
        clientVersion: "",
        additionalHeaders: [:])

    override func setUp() {
        super.setUp()
        tokenHelper = MockTokenHelper()
        url = URL(string: "localhost://")
        sut = ResponseInterceptor(tokenHelper: tokenHelper)
    }

    override func tearDown() {
        url = nil
        tokenHelper = nil
        sut = nil
        super.tearDown()
    }

    func test_interceptAsync_UnauthenticatedError_shouldCallGetValidToken() throws {
        let expectation = XCTestExpectation(description: "Should make getValidToken call")
        let response = try XCTUnwrap(makeHttpResponse(statusCode: 400))
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: response
        ) { _ in
            XCTAssertTrue(self.tokenHelper.getValidTokenCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func makeHttpResponse(statusCode: Int) throws -> HTTPResponse<ApolloType.GetFulfilmentPointsQuery> {
        let response = try XCTUnwrap(
            HTTPURLResponse(
                url: url,
                statusCode: statusCode,
                httpVersion: nil,
                headerFields: nil)
        )
        return HTTPResponse<ApolloType.GetFulfilmentPointsQuery>(
            response: response,
            rawData: statusCode == 200 ? Data() : makeUnauthenticatedErrorData(),
            parsedResponse: nil)
    }

    private func makeUnauthenticatedErrorData() -> Data {
        let unauthenticatedError = #"""
            { "errors": [
                  {
                    "message": "Context creation failed: Access denied: Invalid auth token",
                    "extensions": {
                      "code": "UNAUTHENTICATED"
                    }
                  }
                ]
            }
        """#
        return unauthenticatedError.data(using: .utf8) ?? Data()
    }
}

private final class MockRequest<Operation: GraphQLOperation>: HTTPRequest<Operation> { }
