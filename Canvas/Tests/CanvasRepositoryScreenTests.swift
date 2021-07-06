//
//  CanvasRepositoryScreenTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

// MARK: - Get screen title tests
extension CanvasRepositoryTests {

    func test_getScreenTitleByScreenType_graphQLManagerHasMatchingLanguageCode_completeWithCorrectTranslation() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByScreenTypeQuery.Data.self)

        let getScreenByScreenType = ApolloType
            .GetScreenByScreenTypeQuery
            .Data
            .GetScreenByScreenType(translations: screenTypeTranslations)
        let data = ApolloType
            .GetScreenByScreenTypeQuery
            .Data(getScreenByScreenType: getScreenByScreenType)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetScreenByScreenTypeQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: .discover,
            currentLanguageCode: "en"
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse, self.screenTypeTranslations.first?.title)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getScreenTitleByScreenType_graphQLManagerHasNoMatchingLanguageCode_completeWithFirstTranslation() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByScreenTypeQuery.Data.self)

        let getScreenByScreenType = ApolloType
            .GetScreenByScreenTypeQuery
            .Data
            .GetScreenByScreenType(translations: screenTypeTranslations)
        let data = ApolloType
            .GetScreenByScreenTypeQuery
            .Data(getScreenByScreenType: getScreenByScreenType)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetScreenByScreenTypeQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: .discover,
            currentLanguageCode: "fr"
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse, self.screenTypeTranslations.first?.title)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getScreenTitleByScreenType_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByScreenTypeQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: .discover,
            currentLanguageCode: "en"
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getScreenTitleByScreenId_graphQLManagerHasMatchingLanguageCode_completeWithCorrectTranslation() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByIdQuery.Data.self)

        let getScreenById = ApolloType
            .GetScreenByIdQuery
            .Data
            .GetScreenById(translations: screenIdTranslations)
        let data = ApolloType
            .GetScreenByIdQuery
            .Data(getScreenById: getScreenById)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetScreenByIdQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: "1",
            currentLanguageCode: "en"
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse, self.screenTypeTranslations.first?.title)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getScreenTitleByScreenId_graphQLManagerHasNoMatchingLanguageCode_completeWithFirstTranslation() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByIdQuery.Data.self)

        let getScreenById = ApolloType
            .GetScreenByIdQuery
            .Data
            .GetScreenById(translations: screenIdTranslations)
        let data = ApolloType
            .GetScreenByIdQuery
            .Data(getScreenById: getScreenById)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetScreenByIdQuery
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: "1",
            currentLanguageCode: "fr"
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse, self.screenTypeTranslations.first?.title)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getScreenTitleByScreenId_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetScreenByIdQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getScreenTitle(
            for: "1",
            currentLanguageCode: "en"
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
