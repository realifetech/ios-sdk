//
//  RemoteDiskCacheDataProvidingTests.swift
//  RealifeTech-CoreSDKTests
//
//  Created by Mickey Lee on 05/03/2021.
//

import XCTest
import RxSwift
import RxTest
import CFNetwork
@testable import RealifeTech

final class RemoteDiskCacheDataProvidingTests: XCTestCase {

    private let bag = DisposeBag()

    override func tearDown() {
        mockDiskCache.reset()
        super.tearDown()
    }

    func test_retrieve_localOrRemoteIfExpiredStrategyAndHasLocal_dontSaveToCacheAndReturnLocal() {
        mockDiskCache.shouldReturnedFile = true
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self)
            .subscribe(onNext: { object in
                XCTAssertNil(mockDiskCache.savedFileName)
                XCTAssertNotNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.local.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_localOrRemoteIfExpiredStrategyAndHasNoLocal_savedToCacheAndReturnRemote() {
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self)
            .subscribe(onNext: { object in
                XCTAssertNotNil(mockDiskCache.savedFileName)
                XCTAssertNotNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.remote.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_localAndRemoteIfExpiredStrategyAndHasLocal_dontSaveToCacheAndReturnLocal() {
        mockDiskCache.shouldReturnedFile = true
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .localAndRemoteIfExpired)
            .subscribe(onNext: { object in
                XCTAssertNil(mockDiskCache.savedFileName)
                XCTAssertNotNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.local.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_localAndRemoteIfExpiredStrategyAndHasNoLocal_savedToCacheAndReturnRemote() {
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .localAndRemoteIfExpired)
            .subscribe(onNext: { object in
                XCTAssertNotNil(mockDiskCache.savedFileName)
                XCTAssertNotNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.remote.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_localAndRemoteStrategyAndHasLocal_savedToCacheAndConcatLocalAndRemote() {
        mockDiskCache.shouldReturnedFile = true
        let expectation = XCTestExpectation(description: "onNext emits")
        var emitCount = 0
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .localAndRemote)
            .subscribe(onNext: { object in
                XCTAssertNotNil(mockDiskCache.readFileName)
                emitCount += 1
                if emitCount == 1 {
                    XCTAssertEqual(object.id, TestObject.local.id)
                } else if emitCount == 2 {
                    XCTAssertNotNil(mockDiskCache.savedFileName)
                    XCTAssertEqual(object.id, TestObject.remote.id)
                    expectation.fulfill()
                }
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_remoteStrategyAndHasLocal_dontReadFromCacheAndReturnRemote() {
        mockDiskCache.shouldReturnedFile = true
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .remote)
            .subscribe(onNext: { object in
                XCTAssertNotNil(mockDiskCache.savedFileName)
                XCTAssertNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.remote.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_remoteWithoutCachingResponseStrategyAndHasLocal_dontReadFromCacheAndDontSaveToCacheAndReturnRemote() {
        mockDiskCache.shouldReturnedFile = true
        let expectation = XCTestExpectation(description: "onNext emits")
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .remoteWithoutCachingResponse)
            .subscribe(onNext: { object in
                XCTAssertNil(mockDiskCache.savedFileName)
                XCTAssertNil(mockDiskCache.readFileName)
                XCTAssertEqual(object.id, TestObject.remote.id)
                expectation.fulfill()
            })
            .disposed(by: bag)
        wait(for: [expectation], timeout: 0.01)
    }

    func test_retrieve_whenNoConnection_shouldReturnTheLocal() {
        RemoteDiskCacheDataProvider.Rqstr.shouldReturnNoConnectionError = true
        mockDiskCache.shouldReturnedFile = true
        var emitCount = 0
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .localAndRemote)
            .subscribe(onNext: { object in
                emitCount += 1
                if emitCount == 1 {
                    XCTAssertEqual(object.id, TestObject.local.id)
                } else if emitCount == 2 {
                    XCTAssertEqual(object.id, TestObject.local.id)
                }
            })
            .disposed(by: bag)
    }

    func test_retrieve_whenHasConnection_shouldReturnConcatTheLocalAndTheRemote() {
        RemoteDiskCacheDataProvider.Rqstr.shouldReturnNoConnectionError = false
        mockDiskCache.shouldReturnedFile = true
        var emitCount = 0
        RemoteDiskCacheDataProvider.retrieve(type: TestObject.self, strategy: .localAndRemote)
            .subscribe(onNext: { object in
                emitCount += 1
                if emitCount == 1 {
                    XCTAssertEqual(object.id, TestObject.local.id)
                } else if emitCount == 2 {
                    XCTAssertEqual(object.id, TestObject.remote.id)
                }
            })
            .disposed(by: bag)
    }
}

// MARK: - Mocks

private let mockDiskCache = MockDiskCache()

private final class MockRequester: Requester {

    static var shouldReturnNoConnectionError = false

    static func root() -> String {
        return "localhost://"
    }

    static let endpoint = ""

    static func preDispatchAction() -> Observable<Any?>? {
        return nil
    }

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        return nil
    }

    static func dateFormat() -> RequesterDateFormat? {
        return nil
    }

    class func response(forRequest request: URLRequest) -> Observable<Data> {
        if shouldReturnNoConnectionError {
            let cfError = CFNetworkErrors.cfurlErrorNotConnectedToInternet
            let error: Error = CFErrorCreate(kCFAllocatorDefault, "" as CFErrorDomain, CFIndex(cfError.rawValue), nil)
            return .error(error)
        }
        return .from(optional: TestObject.remoteData)
    }
}

private final class RemoteDiskCacheDataProvider: RemoteDiskCacheDataProviding {

    typealias Cdble =  TestObject
    typealias Rqstr = MockRequester

    class var diskCache: DiskCachable {
        return mockDiskCache
    }
}
