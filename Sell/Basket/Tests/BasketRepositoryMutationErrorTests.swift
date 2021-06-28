//
//  BasketRepositoryMutationErrorTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

extension BasketRepositoryMutationTests {

    func test_transformErrorForEveryQueryAndMutation_returnsCustomError_completeWithTransformedError() {
        BasketRepositoryTestHelper.underTestBasketErrors.forEach { [self] in
            helper_testCreateMyBasket_customError_failureCase($0)
            helper_testUpdateMyBasket_customError_failureCase($0)
            helper_testDeleteMyBasket_customError_failureCase($0)
            helper_testCheckoutMyBasket_customError_failureCase($0)
        }
    }

    private func helper_testCreateMyBasket_customError_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreateMyBasketMutation.Data.self)

        let expectedResult = makeCreateMyBasketGraphQLResult(error: error)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyBasket(input: basketInput) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError.errorCode, error.errorCode)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func helper_testUpdateMyBasket_customError_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyBasketMutation.Data.self)

        let expectedResult = makeUpdateMyBasketGraphQLResult(error: error)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyBasket(input: basketInput) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError.errorCode, error.errorCode)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func helper_testDeleteMyBasket_customError_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyBasketMutation.Data.self)

        let expectedResult = makeDeleteMyBasketGraphQLResult(error: error)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deleteMyBasket { result in
            switch error {
            case .regularError:
                guard case let .success(returnedResponse) = result else {
                    return XCTFail("This test should return success")
                }
                XCTAssertFalse(returnedResponse)
            default:
                guard case let .failure(returnedError) = result else {
                    return XCTFail("This test should return failure")
                }
                XCTAssertEqual(returnedError.errorCode, error.errorCode)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    private func helper_testCheckoutMyBasket_customError_failureCase(_ error: BasketError) {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CheckoutMyBasketMutation.Data.self)

        let expectedResult = makeCheckoutMyBasketGraphQLResult(error: error)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.checkoutMyBasket(input: checkoutInput) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError.errorCode, error.errorCode)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
