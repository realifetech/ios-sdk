//
//  HostAppLoginRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 27/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class HostAppLoginRepositoryTests: XCTestCase {

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: HostAppLoginRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = HostAppLoginRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

extension HostAppLoginRepositoryTests {

    func test_generateNonce_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GenerateNonceMutation.Data.self)

        let generateNonce = ApolloType
            .GenerateNonceMutation
            .Data
            .GenerateNonce(unsafeResultMap: [:])
        var data = ApolloType
            .GenerateNonceMutation
            .Data(generateNonce: generateNonce)
        data.generateNonce?.token = "123"
        let expectedResult = GraphQLResult<
            ApolloType
            .GenerateNonceMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.generateNonce { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse, "123")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_generateNonce_graphQLManagerHasData_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GenerateNonceMutation.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.generateNonce { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_authenticateUser_graphQLManagerHasData_completeWithSuccessCase() {
        let type = ApolloType.AuthenticateUserBySignedUserInfoMutation.Data.self
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: type)

        let token = ApolloType.AuthToken(accessToken: "access",
                                         tokenType: "type",
                                         expiresIn: 3600,
                                         refreshToken: "refresh",
                                         scope: "scope")
        let authenticateUser = ApolloType
            .AuthenticateUserBySignedUserInfoMutation
            .Data
            .AuthenticateUserBySignedUserInfo(unsafeResultMap: [:])
        var data = ApolloType
            .AuthenticateUserBySignedUserInfoMutation
            .Data(authenticateUserBySignedUserInfo: authenticateUser)
        data.authenticateUserBySignedUserInfo?.fragments.authToken = token
        let expectedResult = GraphQLResult<
            ApolloType
            .AuthenticateUserBySignedUserInfoMutation
            .Data
        >(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let userInfo = HostAppUserInfo(emailAddress: "a", firstName: "b", lastName: "c")
        sut.authenticateUserBySignedUserInfo(userInfo: userInfo, salt: "c", nonce: "d", signature: "e") { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.accessToken, "access")
            XCTAssertEqual(returnedResponse.tokenType, "type")
            XCTAssertEqual(returnedResponse.expiresIn, 3600)
            XCTAssertEqual(returnedResponse.refreshToken, "refresh")
            XCTAssertEqual(returnedResponse.scope, "scope")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_authenticateUser_graphQLManagerHasData_completeWithFailureCase() {
        let type = ApolloType.AuthenticateUserBySignedUserInfoMutation.Data.self
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: type)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let userInfo = HostAppUserInfo(emailAddress: "a", firstName: "b", lastName: "c")
        sut.authenticateUserBySignedUserInfo(userInfo: userInfo, salt: "c", nonce: "d", signature: "e") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
