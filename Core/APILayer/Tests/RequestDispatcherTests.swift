//
//  RequestDispatcherTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import RealifeTech

final class RequestDispatcherTests: XCTestCase {

    private var sut: RequestDispatcher!
    private var timeLogger: MockRequestTimeLogger!
    private var url: URL!
    private var request: URLRequest!
    private var scheduler: TestScheduler!
    private let bag = DisposeBag()

    override func setUpWithError() throws {
        try super.setUpWithError()
        url = try XCTUnwrap(URL(string: "https://www.google.com"))
        request = URLRequest(url: url)
        timeLogger = MockRequestTimeLogger()
        scheduler = TestScheduler(initialClock: 0)
    }

    override func tearDown() {
        scheduler = nil
        sut = nil
        timeLogger = nil
        request = nil
        url = nil
        super.tearDown()
    }

    private func makeSUT(with sessionElement: (response: HTTPURLResponse, data: Data)) -> RequestDispatcher {
        RequestDispatcher(
            request: request,
            timeLogger: timeLogger,
            sessionObservable: .just(sessionElement))
    }

    func  test_dispatch_responseCodeIsSuccess_emitsNextEvent() throws {
        let response = try XCTUnwrap(
            HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil)
        )
        sut = makeSUT(with: (response: response, data: Data()))
        let expectation = XCTestExpectation(description: "onNext is fulfilled")
        sut.dispatch()
            .subscribe(onNext: { [self] _ in
                XCTAssertEqual(timeLogger.receivedIdentifier, request.identifier)
                expectation.fulfill()
            })
            .disposed(by: bag)
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }

    func  test_dispatch_responseCodeIsFailure_emitsErrorEvent() throws {
        let response = try XCTUnwrap(
            HTTPURLResponse(
                url: url,
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil)
        )
        sut = makeSUT(with: (response: response, data: Data()))
        let expectation = XCTestExpectation(description: "onError is fulfilled")
        sut.dispatch()
            .subscribe(onError: { [self] error in
                guard let error = error as? APIError else { return }
                XCTAssertEqual(error.statusCode, 400)
                XCTAssertEqual(timeLogger.receivedIdentifier, request.identifier)
                expectation.fulfill()
            })
            .disposed(by: bag)
        scheduler.start()
        wait(for: [expectation], timeout: 0.01)
    }
}

private final class MockRequestTimeLogger: RequestTimeLogger {

    var receivedIdentifier: String?

    override func addRequest(withIdentifier identifier: String, andDate date: Date = Date()) {
        receivedIdentifier = identifier
    }

    override func removeRequest(withIdentifier identifier: String) {
        receivedIdentifier = identifier
    }
}
