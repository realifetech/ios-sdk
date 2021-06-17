//
//  ContentImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 03/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class ContentImplementingTests: XCTestCase {

    private var graphQLManager: MockContentGraphQLManager!
    private var sut: ContentImplementing!

    override func setUp() {
        super.setUp()
        graphQLManager = MockContentGraphQLManager()
        sut = ContentImplementing(graphQLManager: graphQLManager)
    }

    override func tearDown() {
        sut = nil
        graphQLManager = nil
        super.tearDown()
    }

    func test_getWebPage_queryReturnsValidUrl_completeWithWebPage() {
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .success(webPage) = result else {
                return XCTFail("This test should return success case")
            }
            XCTAssertEqual(webPage.url.absoluteString, dummyUrl)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsNilUrl_completeWithEmptyError() {
        graphQLManager.shouldReturnNilUrl = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard
                case let .failure(error) = result,
                let contentError = error as? ContentError
            else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual(contentError, ContentError.urlIsEmpty)
            XCTAssertEqual(contentError.localizedDescription, ContentError.urlIsEmpty.localizedDescription)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsInvalidUrl_completeWithConstructionUrlFailureError() {
        graphQLManager.shouldReturnConstructionError = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard
                case let .failure(error) = result,
                let contentError = error as? ContentError
            else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual(contentError, ContentError.constructUrlFailure)
            XCTAssertEqual(contentError.localizedDescription, ContentError.constructUrlFailure.localizedDescription)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getWebPage_queryReturnsNormalError_completeWithNormalError() {
        graphQLManager.shouldReturnNormalError = true
        let expectation = XCTestExpectation(description: "Completion gets fulfilled")
        sut.getWebPage(forType: .about) { result in
            guard case let .failure(error) = result else {
                return XCTFail("This test should return failure case")
            }
            XCTAssertEqual((error as? DummyError), DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
