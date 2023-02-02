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

    private let ticketFragment = ApolloType.FragmentTicket(id: "1")

    func test_getMyTickets_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketsQuery.Data.self)
        let getMyTicketsResponse = ApolloType.GetMyTicketsQuery.Data.GetMyTicket(edges: [], nextPage: 2)
        let data = ApolloType.GetMyTicketsQuery.Data(getMyTickets: getMyTicketsResponse)
        let expectedResult = GraphQLResult<ApolloType.GetMyTicketsQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.getMyTickets(pageSize: 10) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getMyTickets?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getMyTickets?.nextPage)
        }
    }

    func test_getMyTickets_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketsQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getMyTickets(pageSize: 10) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    func test_getMyTicketById_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketQuery.Data.self)
        let getMyTicket = ApolloType.GetMyTicketQuery.Data.GetMyTicket(unsafeResultMap: [:])
        var data = ApolloType.GetMyTicketQuery.Data(getMyTicket: getMyTicket)
        data.getMyTicket?.fragments.fragmentTicket = ticketFragment
        let expectedResult = GraphQLResult<ApolloType.GetMyTicketQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.getMyTicketById(id: 123) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, self.ticketFragment.id)
        }
    }

    func test_getMyTicketById_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getMyTicketById(id: 321) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    func test_getNextUpcomingTicket_completeWithSuccess() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetUpcomingTicketsQuery.Data.self)
        var edge = ApolloType.GetUpcomingTicketsQuery.Data.GetMyTicket.Edge(unsafeResultMap: [:])
        edge.fragments.fragmentTicket = ticketFragment
        let getMyTicketsResponse = ApolloType.GetUpcomingTicketsQuery.Data.GetMyTicket(edges: [edge])
        let data = ApolloType.GetUpcomingTicketsQuery.Data.init(getMyTickets: getMyTicketsResponse)
        let expectedResult = GraphQLResult<ApolloType.GetUpcomingTicketsQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        var ticket: Ticket?
        sut.getNextUpcomingTicket { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            ticket = returnedResponse
        }
        XCTAssertEqual(ticket?.id, ticketFragment.id)
    }

    func test_getNextUpcomingTicket_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetUpcomingTicketsQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.getNextUpcomingTicket { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
        }
    }

    func test_getTicketAuths_completeWithSuccess() {
        let fragmentTicketAuth = ApolloType.FragmentTicketAuth(id: 2)
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketAuthsQuery.Data.self)
        var getMyTicketAuthResponse = ApolloType.GetMyTicketAuthsQuery.Data.GetMyTicketAuth(unsafeResultMap: [:])
        getMyTicketAuthResponse.fragments.fragmentTicketAuth = fragmentTicketAuth
        let data = ApolloType.GetMyTicketAuthsQuery.Data(getMyTicketAuths: [getMyTicketAuthResponse])
        let expectedResult = GraphQLResult<ApolloType.GetMyTicketAuthsQuery.Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)
        sut.getTicketAuths { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.count, 1)
            XCTAssertEqual(returnedResponse.first?.id, fragmentTicketAuth.id)
        }
    }

    func test_getTicketAuths_completeWithFailure() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetMyTicketAuthsQuery.Data.self)
        graphQLManager.resultReturns = .failure(DummyError.failure)

        var returnedError: Error?
        sut.getTicketAuths { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure")
            }
            returnedError = error
        }
        XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
    }

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
