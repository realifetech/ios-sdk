//
//  OrderRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class OrderRepositoryTests: XCTestCase {

    // MARK: - Helper

    private let orderFragment = ApolloType.FragmentOrder(id: "1", orderNumber: "1")

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: OrderRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = OrderRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

extension OrderRepositoryTests {

    func test_getOrders_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyOrdersQuery.Data.self)

        let getOrders = ApolloType
            .GetMyOrdersQuery
            .Data
            .GetMyOrder(edges: [], nextPage: 123)
        let data = ApolloType
            .GetMyOrdersQuery
            .Data(getMyOrders: getOrders)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyOrdersQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getOrders(
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getMyOrders?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getMyOrders?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getOrders_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyOrdersQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getOrders(
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

    func test_getOrderById_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyOrderByIdQuery.Data.self)

        let getMyOrder = ApolloType
            .GetMyOrderByIdQuery
            .Data
            .GetMyOrder(unsafeResultMap: [:])
        var data = ApolloType
            .GetMyOrderByIdQuery
            .Data(getMyOrder: getMyOrder)
        data.getMyOrder?.fragments.fragmentOrder = orderFragment
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyOrderByIdQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getOrderById(id: orderFragment.id) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.orderFragment.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getOrderById_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyOrderByIdQuery.Data.self)

        let data = ApolloType
            .GetMyOrderByIdQuery
            .Data(getMyOrder: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetMyOrderByIdQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getOrderById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getOrderById_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyOrderByIdQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getOrderById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyOrder_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyOrderMutation.Data.self)

        let updateMyOrder = ApolloType
            .UpdateMyOrderMutation
            .Data
            .UpdateMyOrder(unsafeResultMap: [:])
        var data = ApolloType
            .UpdateMyOrderMutation
            .Data(updateMyOrder: updateMyOrder)
        data.updateMyOrder?.fragments.fragmentOrder = orderFragment
        let expectedResult = GraphQLResult<
            ApolloType
            .UpdateMyOrderMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyOrder(
            id: orderFragment.id,
            input: OrderUpdateInput(
                status: "COMPLETE",
                collectionPreferenceType: .asap,
                checkInTime: nil)
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.orderFragment.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyOrder_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyOrderMutation.Data.self)

        let data = ApolloType
            .UpdateMyOrderMutation
            .Data(updateMyOrder: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .UpdateMyOrderMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyOrder(
            id: orderFragment.id,
            input: OrderUpdateInput(
                status: "COMPLETE",
                collectionPreferenceType: .asap,
                checkInTime: nil)
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_updateMyOrder_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.UpdateMyOrderMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.updateMyOrder(
            id: orderFragment.id,
            input: OrderUpdateInput(
                status: "COMPLETE",
                collectionPreferenceType: .asap,
                checkInTime: nil)
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
