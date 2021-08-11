//
//  GraphQLManagerTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class GraphQLManagerTests: XCTestCase {

    private var sut: GraphQLManager!
    private var networkTransport: MockNetworkTransport!
    private var client: ApolloClient!

    override func setUp() {
        super.setUp()
        networkTransport = MockNetworkTransport()
        client = ApolloClient(networkTransport: networkTransport, store: ApolloStore())
        sut = GraphQLManager(client: client)
    }

    override func tearDown() {
        sut = nil
        client = nil
        super.tearDown()
    }

    func test_dispatchQuery_networkTransportOnSuccess_completeWithSuccessCase() {
        let fulfilmentPoint = ApolloType.GetFulfilmentPointsQuery.Data.GetFulfilmentPoint(edges: [], nextPage: 123)
        let data = UnderTestQueryData(getFulfilmentPoints: fulfilmentPoint)
        let graphQLResult = GraphQLResult<UnderTestQueryData>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        networkTransport.queryResultReturns = .success(graphQLResult)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.dispatch(
            query: UnderTestQuery(pageSize: 10, params: nil),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("The test should return failure case")
            }
            XCTAssertEqual(returnedResponse.data?.getFulfilmentPoints?.edges?.count, fulfilmentPoint.edges?.count)
            XCTAssertEqual(returnedResponse.data?.getFulfilmentPoints?.nextPage, fulfilmentPoint.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_dispatchQuery_networkTransportOnFailure_completeWithFailureCase() {
        networkTransport.queryResultReturns = .failure(DummyError.failure)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.dispatch(
            query: UnderTestQuery(pageSize: 10, params: nil),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("The test should return failure case")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_dispatchMutation_networkTransportOnSuccess_completeWithSuccessCase() {
        let putAnalyticEvent = ApolloType.PutAnalyticEventMutation.Data.PutAnalyticEvent(success: true)
        let data = UnderTestMutationData(putAnalyticEvent: putAnalyticEvent)
        let graphQLResult = GraphQLResult<UnderTestMutationData>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil)
        networkTransport.mutationResultReturns = .success(graphQLResult)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.dispatchMutation(
            mutation: UnderTestMutation(input: .dummy),
            cacheResultToPersistence: false
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("The test should return failure case")
            }
            XCTAssertEqual(returnedResponse.data?.putAnalyticEvent.success, putAnalyticEvent.success)
            XCTAssertEqual(returnedResponse.data?.putAnalyticEvent.message, putAnalyticEvent.message)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_dispatchMutation_networkTransportOnFailure_completeWithFailureCase() {
        networkTransport.mutationResultReturns = .failure(DummyError.failure)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.dispatchMutation(
            mutation: UnderTestMutation(input: .dummy),
            cacheResultToPersistence: false
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("The test should return failure case")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_clearAllCachedData_clientGetsCalled() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        let cache = MockCache()
        let store = ApolloStore(cache: cache)
        let client = ApolloClient(networkTransport: networkTransport, store: store)
        sut = GraphQLManager(client: client)
        sut.clearAllCachedData {
            XCTAssertTrue(cache.clearGetsCalled)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

private typealias UnderTestQuery = ApolloType.GetFulfilmentPointsQuery
private typealias UnderTestQueryData = ApolloType.GetFulfilmentPointsQuery.Data
private typealias UnderTestMutation = ApolloType.PutAnalyticEventMutation
private typealias UnderTestMutationData = ApolloType.PutAnalyticEventMutation.Data

private final class MockNetworkTransport: NetworkTransport {

    var queryResultReturns: Result<GraphQLResult<UnderTestQueryData>, Error>?
    var mutationResultReturns: Result<GraphQLResult<UnderTestMutationData>, Error>?

    func send<Operation: GraphQLOperation>(
        operation: Operation,
        cachePolicy: CachePolicy,
        contextIdentifier: UUID?,
        callbackQueue: DispatchQueue,
        completionHandler: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) -> Cancellable {
        if let resultReturns = queryResultReturns as? Result<GraphQLResult<Operation.Data>, Error> {
            completionHandler(resultReturns)
        } else if let resultReturns = mutationResultReturns as? Result<GraphQLResult<Operation.Data>, Error> {
            completionHandler(resultReturns)
        }
        return EmptyCancellable()
    }
}

private extension ApolloType.AnalyticEvent {

    static var dummy: ApolloType.AnalyticEvent {
        ApolloType.AnalyticEvent(
            type: "type",
            action: "action",
            version: "1",
            timestamp: "now")
    }
}

private final class MockCache: NormalizedCache {

    var clearGetsCalled = false

    func loadRecords(forKeys keys: Set<CacheKey>) throws -> [CacheKey: Record] {
        [:]
    }

    func merge(records: RecordSet) throws -> Set<CacheKey> {
        Set<CacheKey>()
    }

    func removeRecord(for key: CacheKey) throws { }

    func clear() throws {
        clearGetsCalled = true
    }
}
