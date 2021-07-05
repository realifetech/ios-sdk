//
//  CanvasRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class CanvasRepositoryTests: XCTestCase {

    let screenTypeTranslations: [ApolloType.GetScreenByScreenTypeQuery.Data.GetScreenByScreenType.Translation] = [
        ApolloType.GetScreenByScreenTypeQuery.Data.GetScreenByScreenType.Translation(
            language: .en,
            title: "title")
    ]
    let screenIdTranslations: [ApolloType.GetScreenByIdQuery.Data.GetScreenById.Translation] = [
        ApolloType.GetScreenByIdQuery.Data.GetScreenById.Translation(
            language: .en,
            title: "title")
    ]

    func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: CanvasRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = CanvasRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

// MARK: - Get widgets tests
extension CanvasRepositoryTests {

    func test_getWidgetsByScreenType_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetWidgetsByScreenTypeQuery.Data.self)

        let getWidgets = ApolloType
            .GetWidgetsByScreenTypeQuery
            .Data
            .GetWidgetsByScreenType(edges: [], nextPage: 123)
        let data = ApolloType
            .GetWidgetsByScreenTypeQuery
            .Data(getWidgetsByScreenType: getWidgets)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetWidgetsByScreenTypeQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getWidgets(
            for: .discover,
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getWidgetsByScreenType?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getWidgetsByScreenType?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWidgetsByScreenType_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetWidgetsByScreenTypeQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getWidgets(
            for: .discover,
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

    func test_getWidgetsByScreenId_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetWidgetsByScreenIdQuery.Data.self)

        let getWidgets = ApolloType
            .GetWidgetsByScreenIdQuery
            .Data
            .GetWidgetsByScreenId(edges: [], nextPage: 123)
        let data = ApolloType
            .GetWidgetsByScreenIdQuery
            .Data(getWidgetsByScreenId: getWidgets)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetWidgetsByScreenIdQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getWidgets(
            for: "1",
            pageSize: 1,
            page: 1
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getWidgetsByScreenId?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getWidgetsByScreenId?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWidgetsByScreenId_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetWidgetsByScreenIdQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getWidgets(
            for: "1",
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
