//
//  BasketRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class BasketRepositoryTests: XCTestCase {

    private let fragmentBasket = ApolloType.FragmentBasket(netAmount: 100)

    // MARK: - Helpers

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: BasketRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = BasketRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

private extension ApolloType.FragmentBasket {

    init(netAmount: Int) {
        self = ApolloType.FragmentBasket()
        self.netAmount = netAmount
    }
}

private extension BasketError {

    var errorCode: String {
        switch self {
        case .outOfStock:
            return "SELL_BASKET_OUT_OF_STOCK"
        case .priceChange:
            return "SELL_BASKET_PRICE_CHANGE"
        case .mixedBasket:
            return "SELL_BASKET_MIXED"
        case .emptyBasket:
            return "SELL_BASKET_EMPTY"
        default:
            return "default"
        }
    }
}

// MARK: - Get my basket tests
extension BasketRepositoryTests {

    func test_getMyBasket_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

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

    func test_getMyBasket_returnsCustomError_completeWithTransformedError() {
        let errors: [BasketError] = [
            .outOfStock,
            .priceChange,
            .mixedBasket,
            .emptyBasket,
            .regularErrors([DummyError.failure])
        ]
        errors.forEach {
            self.helper_testGetMyBasket_failureCase($0)
        }
    }

    func test_getMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyBasket { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularErrors(errors) = returnedError
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(errors.first as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func helper_testGetMyBasket_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyBasketQuery.Data.self)

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
        data.getMyBasket?.fragments.fragmentBasket = fragmentBasket
        return GraphQLResult<
            ApolloType
            .GetMyBasketQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}
