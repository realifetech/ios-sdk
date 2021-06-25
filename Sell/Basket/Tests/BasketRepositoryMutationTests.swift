//
//  BasketRepositoryMutationTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class BasketRepositoryMutationTests: XCTestCase {

    let basketInput = BasketInput(
        collectionDate: Date(),
        collectionPreferenceType: .asap,
        timeslotId: "1",
        fulfilmentPointId: "1",
        seatInfo: nil,
        items: [BasketItemInput(
                    productId: "1",
                    productVariantId: "1",
                    fulfilmentPointId: "1",
                    quantity: 1,
                    productModifierItems: nil)])
    let checkoutInput = CheckoutInput(netAmount: 100, language: "en")
}

// MARK: - Create my basket tests
extension BasketRepositoryMutationTests {

    func test_createMyBasket_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreateMyBasketMutation.Data.self)

        let expectedResult = makeCreateMyBasketGraphQLResult()
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyBasket(input: basketInput) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.netAmount,
                expectedResult.data?.createMyBasket?.fragments.fragmentBasket.netAmount)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_createMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreateMyBasketMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyBasket(input: basketInput) { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularError(error) = returnedError
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(error as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func makeCreateMyBasketGraphQLResult(
        error: BasketError? = nil
    ) -> GraphQLResult<ApolloType.CreateMyBasketMutation.Data> {
        let extensions: [String: Any] = ["code": error?.errorCode as JSONValue]
        let graphQLError = GraphQLError(["extensions": extensions])

        let createMyBasket = ApolloType
            .CreateMyBasketMutation
            .Data
            .CreateMyBasket(unsafeResultMap: [:])
        var data = ApolloType
            .CreateMyBasketMutation
            .Data(createMyBasket: createMyBasket)
        data.createMyBasket?.fragments.fragmentBasket = BasketRepositoryTestHelper.fragmentBasket
        return GraphQLResult<
            ApolloType
            .CreateMyBasketMutation
            .Data>(
            data: error == nil ? data : nil,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}

// MARK: - Update my basket tests
extension BasketRepositoryMutationTests {

    func test_updateMyBasket_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyBasketMutation.Data.self)

        let expectedResult = makeUpdateMyBasketGraphQLResult()
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyBasket(input: basketInput) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.netAmount,
                expectedResult.data?.updateMyBasket?.fragments.fragmentBasket.netAmount)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyBasketMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyBasket(input: basketInput) { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularError(error) = returnedError
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(error as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func makeUpdateMyBasketGraphQLResult(
        error: BasketError? = nil
    ) -> GraphQLResult<ApolloType.UpdateMyBasketMutation.Data> {
        let extensions: [String: Any] = ["code": error?.errorCode as JSONValue]
        let graphQLError = GraphQLError(["extensions": extensions])

        let updateMyBasket = ApolloType
            .UpdateMyBasketMutation
            .Data
            .UpdateMyBasket(unsafeResultMap: [:])
        var data = ApolloType
            .UpdateMyBasketMutation
            .Data(updateMyBasket: updateMyBasket)
        data.updateMyBasket?.fragments.fragmentBasket = BasketRepositoryTestHelper.fragmentBasket
        return GraphQLResult<
            ApolloType
            .UpdateMyBasketMutation
            .Data>(
            data: error == nil ? data : nil,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}

// MARK: - Delete my basket tests
extension BasketRepositoryMutationTests {

    func test_deleteMyBasket_graphQLManagerReturnsTrue_completeWithSuccessCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyBasketMutation.Data.self)

        let expectedResult = makeDeleteMyBasketGraphQLResult()
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deleteMyBasket { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertTrue(returnedResponse)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deletetMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyBasketMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deleteMyBasket { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularError(error) = returnedError
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(error as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func makeDeleteMyBasketGraphQLResult(
        success: Bool = true,
        error: BasketError? = nil
    ) -> GraphQLResult<ApolloType.DeleteMyBasketMutation.Data> {
        let extensions: [String: Any] = ["code": error?.errorCode as JSONValue]
        let graphQLError = GraphQLError(["extensions": extensions])

        let deleteMyBasket = ApolloType
            .DeleteMyBasketMutation
            .Data
            .DeleteMyBasket(success: success)
        let data = ApolloType
            .DeleteMyBasketMutation
            .Data(deleteMyBasket: deleteMyBasket)
        return GraphQLResult<
            ApolloType
            .DeleteMyBasketMutation
            .Data>(
            data: error == nil ? data : nil,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}

// MARK: - Checkout my basket tests
extension BasketRepositoryMutationTests {

    func test_checkoutMyBasket_graphQLManagerReturnsTrue_completeWithSuccessCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CheckoutMyBasketMutation.Data.self)

        let expectedResult = makeCheckoutMyBasketGraphQLResult()
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.checkoutMyBasket(input: checkoutInput) { result in
            guard case .success = result else {
                return XCTFail("This test should return success")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_checkoutMyBasket_returnsApolloClientError_completeWithFailureCase() {
        let (graphQLManager, sut) = BasketRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CheckoutMyBasketMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.checkoutMyBasket(input: checkoutInput) { result in
            guard
                case let .failure(returnedError) = result,
                case let .regularError(error) = returnedError
            else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(error as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func makeCheckoutMyBasketGraphQLResult(
        error: BasketError? = nil
    ) -> GraphQLResult<ApolloType.CheckoutMyBasketMutation.Data> {
        let extensions: [String: Any] = ["code": error?.errorCode as JSONValue]
        let graphQLError = GraphQLError(["extensions": extensions])

        let checkoutMyBasket = ApolloType
            .CheckoutMyBasketMutation
            .Data
            .CheckoutMyBasket(unsafeResultMap: [:])
        var data = ApolloType
            .CheckoutMyBasketMutation
            .Data(checkoutMyBasket: checkoutMyBasket)
        data.checkoutMyBasket?.fragments.fragmentOrder = ApolloType.FragmentOrder(id: "1", orderNumber: "1")
        return GraphQLResult<
            ApolloType
            .CheckoutMyBasketMutation
            .Data>(
            data: error == nil ? data : nil,
            extensions: nil,
            errors: error == nil ? nil : [graphQLError],
            source: .cache,
            dependentKeys: nil)
    }
}
