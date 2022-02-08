//
//  SSORepositoryTests.swift
//  RealifeTechTests
//
//  Created by Aleksandrs Proskurins on 02/02/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

class SSORepositoryTests: XCTestCase {

    func test_getMyUserSSO_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyUserSsoQuery.Data.self)

        let expextedSub = "12345"
        let getMyUserSso = ApolloType.GetMyUserSsoQuery.Data.GetMyUserSso(sub: expextedSub)

        let expectedResult = GraphQLResult<ApolloType.GetMyUserSsoQuery.Data>(
            data: ApolloType.GetMyUserSsoQuery.Data(getMyUserSso: getMyUserSso),
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        var returnedSut: String?
        sut.getMyUserSSO { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            returnedSut = returnedResponse
        }
        XCTAssertEqual(returnedSut, expextedSub)
    }

    func test_getMyUserSSO_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyUserSsoQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        var returnedError: Error?
        sut.getMyUserSSO { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure")
            }
            returnedError = error
        }
        XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
    }

    private func makeGraphQLManagerAndSUT<DataType>(ofType type: DataType.Type) ->
    (graphQLManager: MockGraphQLManager<DataType>, sut: SSORepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = SSORepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}
