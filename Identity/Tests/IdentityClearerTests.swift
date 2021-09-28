//
//  IdentityClearerTests.swift
//  RealifeTechTests
//
//  Created by Ross Patman Work on 23/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import WebKit
@testable import RealifeTech

final class IdentityClearerTests: XCTestCase {

    private var urlCache: MockURLCache!
    private var httpCookieStorage: MockHTTPCookieStorage!
    private var websiteDataStore: MockWKWebsiteDataStore!
    private var sut: IdentityClearer!

    override func setUpWithError() throws {
        try super.setUpWithError()
        urlCache = MockURLCache()
        httpCookieStorage = MockHTTPCookieStorage()
        websiteDataStore = MockWKWebsiteDataStore()
        sut = IdentityClearer(urlCache: urlCache,
                              httpCookieStorage: httpCookieStorage,
                              websiteDataStore: websiteDataStore)
    }

    override func tearDown() {
        sut = nil
        urlCache = nil
        httpCookieStorage = nil
        websiteDataStore = nil
        super.tearDown()
    }

    func test_clearIdentity_allCleared() {
        let expectation = XCTestExpectation()
        sut.clearIdentity {
            XCTAssertEqual(self.websiteDataStore.dataRecordsRemoved, self.websiteDataStore.dataRecordsToRemove)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
        XCTAssertTrue(urlCache.allCachedResponsesRemoved)
        XCTAssertEqual(urlCache.diskCapacity, 0)
        XCTAssertEqual(urlCache.memoryCapacity, 0)
        XCTAssertNotNil(httpCookieStorage.cookiesRemovedSinceDate)
        XCTAssert(websiteDataStore.dataTypesPassed == ["test"])
    }
}

private final class MockURLCache: URLCacheClearable {
    var allCachedResponsesRemoved = false
    func removeAllCachedResponses() {
        allCachedResponsesRemoved = true
    }
    var diskCapacity: Int = 20
    var memoryCapacity: Int = 20
}

private final class MockHTTPCookieStorage: HTTPCookieStorable {
    var cookiesRemovedSinceDate: Date?
    func removeCookies(since date: Date) {
        cookiesRemovedSinceDate = date
    }
}

private final class MockWKWebsiteDataStore: WKWebDataStoreClearable {
    let dataRecordsToRemove = [WKWebsiteDataRecord(), WKWebsiteDataRecord()]
    var dataRecordsRemoved = [WKWebsiteDataRecord]()
    var dataTypesPassed: Set = [""]
    func fetchDataRecords(ofTypes dataTypes: Set<String>,
                          completionHandler: @escaping ([WKWebsiteDataRecord]) -> Void) {
        dataTypesPassed = dataTypes
        completionHandler(dataRecordsToRemove)
    }

    static func allWebsiteDataTypes() -> Set<String> {
        return ["test"]
    }

    func removeData(ofTypes dataTypes: Set<String>,
                    for dataRecords: [WKWebsiteDataRecord], completionHandler: @escaping () -> Void) {
        dataRecordsRemoved.append(dataRecords[0])
        completionHandler()
    }
}
