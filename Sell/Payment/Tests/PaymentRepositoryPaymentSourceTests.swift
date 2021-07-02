//
//  PaymentRepositoryPaymentSourceTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class PaymentRepositoryPaymentSourceTests: XCTestCase {

    private let fragmentPaymentSource = ApolloType.FragmentPaymentSource(
        id: "1",
        type: .card,
        default: true)

    func test_addPaymentSource_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.AddPaymentSourceToMyWalletMutation.Data.self)

        let addPaymentSource = ApolloType
            .AddPaymentSourceToMyWalletMutation
            .Data
            .AddPaymentSourceToMyWallet(unsafeResultMap: [:])
        var data = ApolloType
            .AddPaymentSourceToMyWalletMutation
            .Data(addPaymentSourceToMyWallet: addPaymentSource)
        data.addPaymentSourceToMyWallet?.fragments.fragmentPaymentSource = fragmentPaymentSource
        let expectedResult = GraphQLResult<
            ApolloType
            .AddPaymentSourceToMyWalletMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.addPaymentSource(
            input: .dummy
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.fragmentPaymentSource.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_addPaymentSource_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.AddPaymentSourceToMyWalletMutation.Data.self)

        let data = ApolloType
            .AddPaymentSourceToMyWalletMutation
            .Data(addPaymentSourceToMyWallet: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .AddPaymentSourceToMyWalletMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.addPaymentSource(
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

    func test_addPaymentSource_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.AddPaymentSourceToMyWalletMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.addPaymentSource(
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

    func test_deletePaymentSource_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyPaymentSourceMutation.Data.self)

        let deletePaymentSource = ApolloType
            .DeleteMyPaymentSourceMutation
            .Data
            .DeleteMyPaymentSource(unsafeResultMap: [:])
        var data = ApolloType
            .DeleteMyPaymentSourceMutation
            .Data(deleteMyPaymentSource: deletePaymentSource)
        data.deleteMyPaymentSource?.fragments.fragmentPaymentSource = fragmentPaymentSource
        let expectedResult = GraphQLResult<
            ApolloType
            .DeleteMyPaymentSourceMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deletePaymentSource(id: "1") { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.fragmentPaymentSource.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deletePaymentSource_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyPaymentSourceMutation.Data.self)

        let data = ApolloType
            .DeleteMyPaymentSourceMutation
            .Data(deleteMyPaymentSource: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .DeleteMyPaymentSourceMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deletePaymentSource(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deletePaymentSource_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyPaymentSourceMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.deletePaymentSource(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyPaymentSources_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyPaymentSourcesQuery.Data.self)

        let getPaymentSources = ApolloType
            .GetMyPaymentSourcesQuery
            .Data
            .GetMyPaymentSource(edges: [], nextPage: 123)
        let data = ApolloType
            .GetMyPaymentSourcesQuery
            .Data(getMyPaymentSources: getPaymentSources)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyPaymentSourcesQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyPaymentSources(
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getMyPaymentSources?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getMyPaymentSources?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getMyPaymentSources_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = PaymentRepositoryTestHelper
            .makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyPaymentSourcesQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getMyPaymentSources(
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
