//
//  APITokenInterceptorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 11/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class APITokenInterceptorTests: XCTestCase {

    private var sut: APITokenInterceptor!
    private var tokenHelper: MockTokenHelper!
    private let graphQLManagerSpy = MockGraphQLManager<ApolloType.GetProductsQuery.Data>()
    private var url: URL!
    private let deviceId = "mockDeviceId"

    private let operation = ApolloType.GetFulfilmentPointsQuery(pageSize: 10, params: nil)
    private lazy var request = MockRequest<ApolloType.GetFulfilmentPointsQuery>(
        graphQLEndpoint: url,
        operation: operation,
        contentType: "",
        clientName: "",
        clientVersion: "",
        additionalHeaders: [:])

    override func setUpWithError() throws {
        try super.setUpWithError()
        tokenHelper = MockTokenHelper()
        url = URL(string: "localhost://")
        sut = APITokenInterceptor(
            tokenHelper: tokenHelper,
            graphQLManager: graphQLManagerSpy,
            deviceId: deviceId)
    }

    override func tearDown() {
        sut = nil
        tokenHelper = nil
        url = nil
        super.tearDown()
    }

    func test_interceptAsync_noResponse_shouldReturnFailureCase() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: nil
        ) { result in
            guard case let .failure(error) = result else {
                return XCTFail("should fail")
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_interceptAsync_httpStatusCodeIs400AndTokenHelperReturnsToken_shouldRetryWithNewToken() throws {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let response = try XCTUnwrap(makeHttpResponse(statusCode: 400))
        let token = "New Token"
        tokenHelper.tokenReturns = token
        tokenHelper.tokenIsValidReturns = true
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: response
        ) { _ in
            XCTAssertEqual(self.request.additionalHeaders["Authorization"], "Bearer \(token)")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_interceptAsync_httpStatusCodeIs400AndTokenHelperReturnsToken_shouldUpdateGraphQLHeader() throws {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let response = try XCTUnwrap(makeHttpResponse(statusCode: 400))
        let token = "New Token"
        tokenHelper.tokenReturns = token
        tokenHelper.tokenIsValidReturns = true
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: response
        ) { _ in
            XCTAssertTrue(self.graphQLManagerSpy.didCallUpdateHeadersToNetworkTransport)
            XCTAssertEqual(self.graphQLManagerSpy.receivedDeviceId, self.deviceId)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_interceptAsync_httpStatusCodeIs200_shouldProceed() throws {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let response = try XCTUnwrap(makeHttpResponse(statusCode: 200))
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: response
        ) { _ in
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
            rawData: Data(),
            parsedResponse: nil)
    }
}

private final class MockTokenHelper: APITokenManagable {

    var tokenReturns: String?
    var tokenIsValidReturns: Bool = false

    var token: String? { tokenReturns }
    var tokenIsValid: Bool { tokenIsValidReturns }
    var refreshToken: String? { nil }
    var refreshTokenIsValid: Bool { false }

    func getValidToken(_ completion: ((Result<Void, Error>) -> Void)?) {
        completion?(.success(()))
    }

    func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) { }

    func removeCredentials() { }
}

private final class MockRequest<Operation: GraphQLOperation>: HTTPRequest<Operation> { }
