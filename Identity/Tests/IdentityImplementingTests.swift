//
//  IdentityImplementingTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 27/01/2022.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

class IdentityImplementingTests: XCTestCase {

    func test_identify_logged_userId_Persisted() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_identify_logged_userId_Persisted") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        sut.identify(userId: "123", traits: [.firstName: "John",
                                             .lastName: "Smith",
                                             .dynamic(rawValue: "otherKey"): "AAA"]) { result in
            switch result {
            case .success:
                guard let loggedEvent = spy.eventsLogged.first,
                      let body = loggedEvent.new else { return XCTFail("Failure") }
                XCTAssertEqual(loggedEvent.type, "user")
                XCTAssertEqual(loggedEvent.action, "identify")
                XCTAssertTrue(body.contains("\"firstName\":\"John\""))
                XCTAssertTrue(body.contains("\"lastName\":\"Smith\""))
                XCTAssertTrue(body.contains("\"otherKey\":\"AAA\""))
                XCTAssertTrue(identityPersister.retrieveUserId() == "123")
            case .failure: XCTFail("Failure")
            }
        }
    }

    func test_alias_logged() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_alias_logged") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        sut.alias(aliasType: .dynamic(rawValue: "ABC"), aliasId: "123") { result in
            switch result {
            case .success:
                guard let loggedEvent = spy.eventsLogged.first,
                      let body = loggedEvent.new else { return XCTFail("Failure") }
                XCTAssertEqual(loggedEvent.type, "user")
                XCTAssertEqual(loggedEvent.action, "alias")
                XCTAssertTrue(body.contains("\"ABC\":\"123\""))
            case .failure: XCTFail("Failure")
            }
        }
    }

    func test_clear() {
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_clear") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: MockGraphQLManager<Void>())
        XCTAssertNil(identityPersister.retrieveUserId())
        sut.identify(userId: "aaa", traits: [:], completion: nil)
        XCTAssertEqual(identityPersister.retrieveUserId(), "aaa")
        sut.clear()
        XCTAssertNil(identityPersister.retrieveUserId())
    }

    func test_deleteMyAccount_completeWithSuccess() {
        let successResult = true
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyAccountMutation.Data.self)
        let successResponse = ApolloType.DeleteMyAccountMutation.Data.DeleteMyAccount(
            success: successResult,
            message: "success")
        let data = ApolloType.DeleteMyAccountMutation.Data(deleteMyAccount: successResponse)
        let expectedResult = GraphQLResult<ApolloType.DeleteMyAccountMutation.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        var returnedBool: Bool?
        sut.deleteMyAccount { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            returnedBool = returnedResponse
        }
        XCTAssertEqual(returnedBool, successResult)
    }

    func test_deleteMyAccount_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.DeleteMyAccountMutation.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)

        var returnedError: Error?
        sut.deleteMyAccount { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure")
            }
            returnedError = error
        }
        XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
    }

    func test_getSSO_completeWithSuccess() {
        let expectedUrl = "https://testUrl.com"
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetSsoQuery.Data.self)
        let successResponse = ApolloType.GetSsoQuery.Data.GetSso(authUrl: expectedUrl)
        let data = ApolloType.GetSsoQuery.Data(getSso: successResponse)
        let expectedResult = GraphQLResult<ApolloType.GetSsoQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        var returnedSSO: SSO?
        sut.getSSO(provider: "axs") { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            returnedSSO = returnedResponse
        }
        XCTAssertEqual(returnedSSO?.authUrl, expectedUrl)
    }

    func test_getSSO_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetSsoQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)

        var returnedError: Error?
        sut.getSSO(provider: "axs") { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure")
            }
            returnedError = error
        }
        XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
    }

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: Identity) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let spy = MockAnalyticsLogger()
        let defaults = UserDefaults(suiteName: "test_deleteMyAccount") ?? .standard
        let identityPersister = IdentityPersister(defaults: defaults)
        let sut = IdentityFactory.makeModule(analyticsLogger: spy,
                                             identityPersister: identityPersister,
                                             graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}
