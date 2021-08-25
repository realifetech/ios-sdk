//
//  RequesterTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
@testable import RealifeTech

final class RequesterTests: XCTestCase {

    private var sut: SUT.Type!
    private let bag = DisposeBag()

    override func setUp() {
        super.setUp()
        sut = SUT.self
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_requestForId() {
        let request = sut.request(forId: "test")
        let expectedUrl = sut.root() + sut.endpoint + "/test"
        XCTAssertEqual(request.url?.absoluteString, expectedUrl)
        XCTAssertEqual(request.httpMethod, HttpMethod.GET.rawValue)
    }

    func test_responseForRequest_preDispatchActionIsNotNil_observableEmitsEvents() {
        let expectation = XCTestExpectation(description: "error is emitted due to dummy URL")
        sut.hasPreDispatchAction = true
        let request = sut.request(forId: "test")
        sut.response(forRequest: request)
            .subscribe(onError: { _ in
                expectation.fulfill()
            }).disposed(by: bag)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_responseForRequest_preDispatchActionIsNil_observableEmitsEvents() {
        let expectation = XCTestExpectation(description: "error is emitted due to dummy URL")
        sut.hasPreDispatchAction = false
        let request = sut.request(forId: "test")
        sut.response(forRequest: request)
            .subscribe(onError: { _ in
                expectation.fulfill()
            }).disposed(by: bag)
        wait(for: [expectation], timeout: 0.5)
    }

    func test_applyInterceptors_interceptrosAreAddedToTheRequest() {
        var request = sut.request(forId: "test")
        request = sut.applyInterceptors(request: request)
        XCTAssertEqual(request.allHTTPHeaderFields?["header"], "A")
    }
}

private struct SUT: Requester {

    static var hasPreDispatchAction = true

    static func root() -> String {
        "root"
    }

    static var endpoint: String = "/endpoint"

    static func preDispatchAction() -> Observable<Any?>? {
        hasPreDispatchAction ? .just("preDispatchAction") : nil
    }

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        func stubInterceptor(toRequest request: URLRequest) -> URLRequest {
            var request = request
            request.addValue("A", forHTTPHeaderField: "header")
            return request
        }
        return [stubInterceptor]
    }

    static func dateFormat() -> RequesterDateFormat? {
        .timestampSeconds
    }
}
