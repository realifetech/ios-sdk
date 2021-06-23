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

    private func makeFulfilmentPointCategoryFragment(id: String = "1") -> ApolloType.FragmentFulfilmentPointCategory {
        ApolloType.FragmentFulfilmentPointCategory(id: id)
    }
}

// MARK: - FulfilmentPoint queries tests
extension FulfilmentPointRepositoryTests {

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
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getFulfilmentPoints?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getFulfilmentPoints?.nextPage)
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
}

// MARK: - FulfilmentPointCategory queries tests
extension FulfilmentPointRepositoryTests {

    func test_getFulfilmentPointCategories_graphQLManagerHasData_completeWithSuccessCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointCategoriesQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut

        let getFulfilmentPointCategories = ApolloType
            .GetFulfilmentPointCategoriesQuery
            .Data
            .GetFulfilmentPointCategory(edges: [], nextPage: 123)
        let data = ApolloType
            .GetFulfilmentPointCategoriesQuery
            .Data(getFulfilmentPointCategories: getFulfilmentPointCategories)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointCategoriesQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointCategories(
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getFulfilmentPointCategories?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getFulfilmentPointCategories?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointCategories_graphQLManagerReturnsError_completeWithFailureCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointCategoriesQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointCategories(
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

    func test_getFulfilmentPointCategoryById_graphQLManagerHasData_completeWithSuccessCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointCategoryByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        let fulfilmentPointCategoryFragment = makeFulfilmentPointCategoryFragment()

        let getFulfilmentPointCategory = ApolloType
            .GetFulfilmentPointCategoryByIdQuery
            .Data
            .GetFulfilmentPointCategory(unsafeResultMap: [:])
        var data = ApolloType
            .GetFulfilmentPointCategoryByIdQuery
            .Data(getFulfilmentPointCategory: getFulfilmentPointCategory)
        data.getFulfilmentPointCategory?.fragments.fragmentFulfilmentPointCategory = fulfilmentPointCategoryFragment
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointCategoryByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointCategoryById(id: fulfilmentPointCategoryFragment.id) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, fulfilmentPointCategoryFragment.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointCategoryById_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointCategoryByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut

        let data = ApolloType
            .GetFulfilmentPointCategoryByIdQuery
            .Data(getFulfilmentPointCategory: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetFulfilmentPointCategoryByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointCategoryById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getFulfilmentPointCategoryById_graphQLManagerReturnsError_completeWithFailureCase() {
        let tuple = makeGraphQLManagerAndSUT(ofType: ApolloType.GetFulfilmentPointCategoryByIdQuery.Data.self)
        let graphQLManager = tuple.graphQLManager
        let sut = tuple.sut
        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getFulfilmentPointCategoryById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}