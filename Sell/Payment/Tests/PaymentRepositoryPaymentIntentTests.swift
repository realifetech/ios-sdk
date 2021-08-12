//
//  PaymentRepositoryPaymentIntentTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 01/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class PaymentRepositoryPaymentIntentTests: XCTestCase {

    func test_createMyPaymentIntent_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreatePaymentIntentMutation.Data.self)

        let createPaymentIntent = ApolloType
            .CreatePaymentIntentMutation
            .Data
            .CreatePaymentIntent(unsafeResultMap: [:])
        var data = ApolloType
            .CreatePaymentIntentMutation
            .Data(createPaymentIntent: createPaymentIntent)
        data.createPaymentIntent?.fragments.fragmentPaymentIntent = fragmentPaymentIntent
        let expectedResult = GraphQLResult<
            ApolloType
            .CreatePaymentIntentMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyPaymentIntent(input: .dummy) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.fragmentPaymentIntent.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_createMyPaymentIntent_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreatePaymentIntentMutation.Data.self)

        let data = ApolloType
            .CreatePaymentIntentMutation
            .Data(createPaymentIntent: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .CreatePaymentIntentMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyPaymentIntent(input: .dummy) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_createMyPaymentIntent_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.CreatePaymentIntentMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.createMyPaymentIntent(input: .dummy) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyPaymentIntent_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyPaymentIntentMutation.Data.self)

        let updatePaymentIntent = ApolloType
            .UpdateMyPaymentIntentMutation
            .Data
            .UpdateMyPaymentIntent(unsafeResultMap: [:])
        var data = ApolloType
            .UpdateMyPaymentIntentMutation
            .Data(updateMyPaymentIntent: updatePaymentIntent)
        data.updateMyPaymentIntent?.fragments.fragmentPaymentIntent = fragmentPaymentIntent
        let expectedResult = GraphQLResult<
            ApolloType
            .UpdateMyPaymentIntentMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyPaymentIntent(
            id: fragmentPaymentIntent.id,
            input: .dummy
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.fragmentPaymentIntent.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyPaymentIntent_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyPaymentIntentMutation.Data.self)

        let data = ApolloType
            .UpdateMyPaymentIntentMutation
            .Data(updateMyPaymentIntent: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .UpdateMyPaymentIntentMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyPaymentIntent(
            id: fragmentPaymentIntent.id,
            input: .dummy
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyPaymentIntent_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyPaymentIntentMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyPaymentIntent(
            id: fragmentPaymentIntent.id,
            input: .dummy
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyPaymentIntent_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyPaymentIntentQuery.Data.self)

        let getPaymentIntent = ApolloType
            .GetMyPaymentIntentQuery
            .Data
            .GetMyPaymentIntent(unsafeResultMap: [:])
        var data = ApolloType
            .GetMyPaymentIntentQuery
            .Data(getMyPaymentIntent: getPaymentIntent)
        data.getMyPaymentIntent?.fragments.fragmentPaymentIntent = fragmentPaymentIntent
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyPaymentIntentQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyPaymentIntent(id: fragmentPaymentIntent.id) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.fragmentPaymentIntent.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyPaymentIntent_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyPaymentIntentQuery.Data.self)

        let data = ApolloType
            .GetMyPaymentIntentQuery
            .Data(getMyPaymentIntent: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyPaymentIntentQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyPaymentIntent(id: fragmentPaymentIntent.id) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyPaymentIntent_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyPaymentIntentQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyPaymentIntent(id: fragmentPaymentIntent.id) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

private extension PaymentRepositoryPaymentIntentTests {

    var fragmentPaymentIntent: ApolloType.FragmentPaymentIntent {
        ApolloType.FragmentPaymentIntent(
            id: "1",
            orderType: .foodAndBeverage,
            orderId: "1",
            status: .processing,
            amount: 100,
            currency: "GBP",
            livemode: false)
    }
}

private extension PaymentIntentInput {

    static var dummy: PaymentIntentInput {
        PaymentIntentInput(
            orderType: .foodAndBeverage,
            orderId: "1",
            paymentSource: .dummy,
            amount: 100,
            currency: "GBP",
            savePaymentSource: true,
            livemode: false,
            cancellationReason: nil,
            receiptEmail: nil)
    }
}

private extension PaymentIntentUpdateInput {

    static var dummy: PaymentIntentUpdateInput {
        PaymentIntentUpdateInput(
            status: .canceled,
            paymentSource: .dummy,
            savePaymentSource: true)
    }
}
