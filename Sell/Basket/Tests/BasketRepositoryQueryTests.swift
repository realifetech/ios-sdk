//
//  BasketRepositoryQueryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class BasketRepositoryQueryTests: XCTestCase {

    func test_getMyBasket_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

        let expectedResult = makeGetMyBasketGraphQLResult()
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyBasket { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.netAmount,
                expectedResult.data?.getMyBasket?.fragments.fragmentBasket.netAmount)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyBasket { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularError(error) = returnedError.type
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(error as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_transformErrorForEveryQueryAndMutation_returnsCustomError_completeWithTransformedError() {
        BasketRepositoryTestHelper.underTestBasketErrors.map {
            BasketError(type: $0, message: "A")
        }.forEach {
            self.helper_testGetMyBasket_customeError_failureCase($0)
        }
    }

    private func helper_testGetMyBasket_customeError_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

        let expectedResult = makeGetMyBasketGraphQLResult(error: error)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyBasket { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError.errorCode, error.errorCode)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func makeGetMyBasketGraphQLResult(
        error: BasketError? = nil
    ) -> GraphQLResult<ApolloType.GetMyBasketQuery.Data> {
        let extensions: [String: Any] = ["code": error?.errorCode as JSONValue]
        let graphQLError = GraphQLError(["extensions": extensions])

        let getMyBasket = ApolloType
            .GetMyBasketQuery
            .Data
            .GetMyBasket(unsafeResultMap: [:])
        var data = ApolloType
            .GetMyBasketQuery
            .Data(getMyBasket: getMyBasket)
        data.getMyBasket?.fragments.fragmentBasket = BasketRepositoryTestHelper.fragmentBasket
        return GraphQLResult<
            ApolloType
            .GetMyBasketQuery
            .Data>(
            data: error == nil ? data : nil,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}
