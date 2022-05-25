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
    private var url: URL!

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
        sut = APITokenInterceptor(tokenHelper: tokenHelper)
    }

    override func tearDown() {
        sut = nil
        tokenHelper = nil
        url = nil
        super.tearDown()
    }

    func test_interceptAsync_whenTokenIsValid_headerContainsBearerToken() throws {
        let response = try XCTUnwrap(makeHttpResponse())
        let token = "Token"
        tokenHelper.tokenReturns = token
        tokenHelper.tokenIsValidReturns = true
        sut.interceptAsync(
            chain: RequestChain(interceptors: [sut]),
            request: request,
            response: response
        ) { _ in
            XCTAssertEqual(self.request.additionalHeaders["Authorization"], "Bearer \(token)")
        }
    }

    private func makeHttpResponse() throws -> HTTPResponse<ApolloType.GetFulfilmentPointsQuery> {
        let response = try XCTUnwrap(
            HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil)
        )
        return HTTPResponse<ApolloType.GetFulfilmentPointsQuery>(
            response: response,
            rawData: Data(),
            parsedResponse: nil)
    }
}

final class MockTokenHelper: APITokenManagable {

    var tokenReturns: String?
    var tokenIsValidReturns: Bool = false
    var getValidTokenCalled = false

    var token: String? { tokenReturns }
    var tokenIsValid: Bool { tokenIsValidReturns }
    var refreshToken: String? { nil }
    var refreshTokenIsValid: Bool { false }

    func getValidToken(_ completion: ((Result<Void, Error>) -> Void)?) {
        getValidTokenCalled = true
        completion?(.success(()))
    }

    func storeCredentials(accessToken: String, secondsExpiresIn: Int, refreshToken: String?) { }

    func removeCredentials() { }
}

private final class MockRequest<Operation: GraphQLOperation>: HTTPRequest<Operation> { }
