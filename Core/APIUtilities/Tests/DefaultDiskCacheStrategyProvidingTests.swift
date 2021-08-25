//
//  DefaultDiskCacheStrategyProvidingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import RxSwift
@testable import RealifeTech

final class DefaultDiskCacheStrategyProvidingTests: XCTestCase {

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

    func test_retrieveWithForceUpdate_forceUpdateIsFalse_strategyIsLocalAndRemote() {
        let expectation = XCTestExpectation(description: "event is emitted")
        sut.retrieve(type: TestObject.self, forceUpdate: false)
            .subscribe(onNext: { object in
                XCTAssertEqual(object.id, "1")
                XCTAssertEqual(self.sut.receivedStrategy, .localAndRemote)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieveWithForceUpdate_forceUpdateIsTrue_strategyIsLocalAndForceRemote() {
        let expectation = XCTestExpectation(description: "event is emitted")
        sut.retrieve(type: TestObject.self, forceUpdate: true)
            .subscribe(onNext: { object in
                XCTAssertEqual(object.id, "1")
                XCTAssertEqual(self.sut.receivedStrategy, .localAndForcedRemote)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }
}

private struct SUT: DefaultDiskCacheStrategyProviding, RemoteDiskCacheDataProviding {

    typealias Cdble = TestObject
    typealias Rqstr = MockRequester

    static var receivedStrategy: DiskCacheDataProvidingStrategy?

    static func retrieve<Model: Codable>(
        type: Model.Type,
        forRequest request: URLRequest,
        privateObj: Bool,
        strategy: DiskCacheDataProvidingStrategy
    ) -> Observable<Model> {
        receivedStrategy = strategy
        return .from(optional: TestObject(id: "1") as? Model)
    }
}

private struct MockRequester: Requester {

    static func root() -> String {
        "root"
    }

    static var endpoint: String = "endpoint"

    static func preDispatchAction() -> Observable<Any?>? {
        nil
    }

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        nil
    }

    static func dateFormat() -> RequesterDateFormat? {
        .timestampSeconds
    }
}
