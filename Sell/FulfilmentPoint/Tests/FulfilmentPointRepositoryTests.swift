//
//  FulfilmentPointRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class FulfilmentPointRepositoryTests: XCTestCase {

    func test_getFulfilmentPoints_graphQLManagerHasData_completeWithSuccessCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointsQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut

        let getFulfilmentPoint = ApolloType
            .GetFulfilmentPointsQuery
            .Data
            .GetFulfilmentPoint(edges: [], nextPage: 123)
        let data = ApolloType
            .GetFulfilmentPointsQuery
            .Data(getFulfilmentPoints: getFulfilmentPoint)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointsQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPoints(
            pageSize: 1,
            page: 1,
            filters: nil
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.items.count, expectedResult.data?.getFulfilmentPoints?.edges?.count)
            XCTAssertEqual(returnedResponse.nextPage, expectedResult.data?.getFulfilmentPoints?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPoints_graphQLManagerReturnsError_completeWithFailureCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointsQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPoints(
            pageSize: 1,
            page: 1,
            filters: nil
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointById_graphQLManagerHasData_completeWithSuccessCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        let fulfilmentPointFragment = makeFulfilmentPointFragment()

        let getFulfilmentPoint = ApolloType
            .GetFulfilmentPointByIdQuery
            .Data
            .GetFulfilmentPoint(unsafeResultMap: [:])
        var data = ApolloType
            .GetFulfilmentPointByIdQuery
            .Data(getFulfilmentPoint: getFulfilmentPoint)
        data.getFulfilmentPoint?.fragments.fragmentFulfilmentPoint = fulfilmentPointFragment
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointById(id: fulfilmentPointFragment.id) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, fulfilmentPointFragment.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointById_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut

        let data = ApolloType
            .GetFulfilmentPointByIdQuery
            .Data(getFulfilmentPoint: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointById_graphQLManagerReturnsError_completeWithFailureCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    // MARK: - Helper

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: FulfilmentPointRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = FulfilmentPointRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }

    private func makeFulfilmentPointFragment(id: String = "1") ->  ApolloType.FragmentFulfilmentPoint {
        ApolloType.FragmentFulfilmentPoint(id: id)
    }
}
