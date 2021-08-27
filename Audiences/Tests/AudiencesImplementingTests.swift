//
//  AudiencesImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 26/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
import GraphQL
@testable import RealifeTech

final class AudiencesImplementingTests: XCTestCase {

    typealias DataType = ApolloType.BelongsToAudienceWithExternalIdQuery.Data

    private var graphQLManager: MockGraphQLManager<DataType>!
    private var sut: AudiencesImplementing!

    override func setUp() {
        super.setUp()
        graphQLManager = MockGraphQLManager<DataType>()
        sut = AudiencesImplementing(graphQLManager: graphQLManager)
    }

    override func tearDown() {
        sut = nil
        graphQLManager = nil
        super.tearDown()
    }

    private func makeQueryResultData(shouldBelongToAudience: Bool?) -> GraphQLResult<DataType> {
        var device = DataType.Me.Device()
        device.belongsToAudienceWithExternalId = shouldBelongToAudience
        let data = DataType(me: DataType.Me(device: device))
        return GraphQLResult<DataType>(
            data: shouldBelongToAudience == nil ? nil : data,
            extensions: nil,
            errors: nil,
            source: .server,
            dependentKeys: nil)
    }

    func test_deviceIsMemberOfAudience_graphQLManagerReturnsTrue_shouldReflectGraphQLManagerResult() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        graphQLManager.resultReturns = .success(makeQueryResultData(shouldBelongToAudience: true))
        sut.deviceIsMemberOfAudience(audienceId: "A") { result in
            guard case let .success(isAudience) = result else {
                return XCTFail("Should go with success")
            }
            XCTAssertTrue(isAudience)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deviceIsMemberOfAudience_graphQLManagerReturnsNil_shouldNotBelong() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        graphQLManager.resultReturns = .success(makeQueryResultData(shouldBelongToAudience: nil))
        sut.deviceIsMemberOfAudience(audienceId: "A") { result in
            guard case let .success(isAudience) = result else {
                return XCTFail("Should go with success")
            }
            XCTAssertFalse(isAudience)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_deviceIsMemberOfAudience_graphQLManagerReturnsError_shouldReturnFailure() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        graphQLManager.resultReturns = .failure(DummyError.failure)
        sut.deviceIsMemberOfAudience(audienceId: "A") { result in
            guard case let .failure(error) = result else {
                return XCTFail("Should go with failure")
            }
            XCTAssertEqual(error as? DummyError, .failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
