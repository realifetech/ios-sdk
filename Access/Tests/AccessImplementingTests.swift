//
//  AccessImplementingTests.swift
//  RealifeTechTests
//
//  Created by YOU-HSUAN YU on 2023/1/16.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class AccessImplementingTests: XCTestCase {

    func test_getWalletPass_completeWithSuccess() {
        let expectedUrl = "https://pass.com"
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketWalletPassQuery.Data.self)
        let successResponse = ApolloType.GetMyTicketWalletPassQuery.Data.GetMyTicketWalletPass(url: expectedUrl)
        let data = ApolloType.GetMyTicketWalletPassQuery.Data(getMyTicketWalletPass: successResponse)
        let expectedResult = GraphQLResult<ApolloType.GetMyTicketWalletPassQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        var returnedWalletPass: WalletPass?
        sut.getWalletPass(ticketId: "1") { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            returnedWalletPass = returnedResponse
        }
        XCTAssertEqual(returnedWalletPass?.url, expectedUrl)
    }

    func test_getWalletPass_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketWalletPassQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)

        var returnedError: Error?
        sut.getWalletPass(ticketId: "1") { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure")
            }
            returnedError = error
        }
        XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
    }

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: Access) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = AccessFactory.makeModule(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}
