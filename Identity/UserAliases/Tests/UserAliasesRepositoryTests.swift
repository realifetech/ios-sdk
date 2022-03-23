//
//  UserAliasesRepositoryTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2022/3/23.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class UserAliasesRepositoryTests: XCTestCase {

    typealias ApolloTypeDataMe = ApolloType.GetUserAliasesQuery.Data.Me

    func test_getUserAliases_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetUserAliasesQuery.Data.self)
        let testUserAliasType = "AXS_FLASH_ID"
        let testValue = "987654321"
        let data = createGetUserAliasesQueryData(type: testUserAliasType, value: testValue)
        let expectedResult = GraphQLResult<ApolloType.GetUserAliasesQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getUserAliases { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse?.first?.userAliasType, testUserAliasType)
            XCTAssertEqual(returnedResponse?.first?.value, testValue)
        }
        expectation.fulfill()
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getUserAliases_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetUserAliasesQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getUserAliases { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    // MARK: Helpers

    private func createGetUserAliasesQueryData(type: String, value: String) -> ApolloType.GetUserAliasesQuery.Data {
        let userAliasType = ApolloTypeDataMe.User.UserAlias.UserAliasType(userAliasType: type)
        let userAlias = ApolloTypeDataMe.User.UserAlias(userAliasType: userAliasType, value: value)
        let user = ApolloTypeDataMe.User(userAliases: [userAlias])
        return ApolloType.GetUserAliasesQuery.Data(me: ApolloTypeDataMe(user: user))
    }

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: UserAliasesRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = UserAliasesRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}
