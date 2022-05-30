//
//  CoreImplementingTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class CoreImplementingTests: XCTestCase {

    private var sut: CoreImplementing!
    private var apiHelper: SpyApiHelper!
    private var graphQLManager: SpyGraphQLManager!
    private var diskCache: SpyDiskCache!
    private var urlSessionCleaner: URLSessionCacheCleanerSpy!

    override func setUp() {
        super.setUp()
        apiHelper = SpyApiHelper()
        graphQLManager = SpyGraphQLManager()
        diskCache = SpyDiskCache()
        urlSessionCleaner = URLSessionCacheCleanerSpy()
        sut = CoreImplementing(
            deviceHelper: UIDeviceWrapper(),
            reachabilityHelper: ReachabilityChecker(bluetoothManager: BluetoothManagerWrapper()),
            apiHelper: apiHelper,
            graphQLManager: graphQLManager,
            diskCache: diskCache,
            urlSessionCleaner: urlSessionCleaner
        )
    }

    override func tearDown() {
        sut = nil
        diskCache = nil
        graphQLManager = nil
        apiHelper = nil
        super.tearDown()
    }

    func test_requestValidToken_apiHelperGetsCalled() {
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.requestValidToken { _ in
            XCTAssertTrue(self.apiHelper.didRequestToken)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_storeCredentials_storeToApiHelper() throws {
        sut.storeCredentials(
            accessToken: "A",
            secondsExpiresIn: 1,
            refreshToken: "B")
        let tokens = try XCTUnwrap(apiHelper.receivedTokens)
        XCTAssertEqual(tokens.accessToken, "A")
        XCTAssertEqual(tokens.refreshToken, "B")
        XCTAssertNotNil(graphQLManager.receivedDeviceId)
        let tokensInGraphQLManager = try XCTUnwrap((graphQLManager.newApiHelper as? SpyApiHelper)?.receivedTokens)
        XCTAssertEqual(tokensInGraphQLManager.accessToken, "A")
    }

    func test_clearStoredCredentials_clearFromApiHelper() {
        sut.clearStoredCredentials()
        XCTAssertTrue(apiHelper.didRemoveCredentials)
    }

    func test_clearPrivateCachedData_clearFromApiHelperAndDiskCache() {
        sut.clearPrivateCachedData()
        XCTAssertTrue(apiHelper.didRemoveCredentials)
        XCTAssertEqual(diskCache.receivedDeletionStrategy, .privateOnly)
    }

    func test_clearOutdatedCachedData_clearFromDiskCache() {
        sut.clearOutdatedCachedData()
        XCTAssertEqual(diskCache.receivedDeletionStrategy, .outdatedOnly)
    }

    func test_clearAllNetworkCachedData_appropriateCacheCleaned() {
        sut.clearAllNetworkCachedData()
        XCTAssertTrue(graphQLManager.didClearAllData)
        XCTAssertTrue(urlSessionCleaner.removeAllCachedDataWasCalled)
        XCTAssertEqual(diskCache.receivedDeletionStrategy, .allNonPrivate)
    }
}

// MARK: - Spies
final class SpyApiHelper: APITokenManagable {

    var tokenReturns: String?
    var tokenIsValidReturns = false
    var refreshTokenReturns: String?
    var refreshTokenIsValidReturns = false

    var token: String? { tokenReturns }
    var tokenIsValid: Bool { tokenIsValidReturns }
    var refreshToken: String? { refreshTokenReturns }
    var refreshTokenIsValid: Bool { refreshTokenIsValidReturns }

    var didRequestToken = false
    var receivedTokens: (accessToken: String, refreshToken: String)?
    var didRemoveCredentials = false

    func getValidToken(_ completion: ((Result<Void, Error>) -> Void)?) {
        didRequestToken = true
        completion?(.success(()))
    }

    func storeCredentials(
        accessToken: String,
        secondsExpiresIn: Int,
        refreshToken: String?
    ) {
        receivedTokens = (accessToken: accessToken, refreshToken: refreshToken ?? "")
    }

    func removeCredentials() {
        didRemoveCredentials = true
    }
}

private final class SpyGraphQLManager: GraphQLManageable {

    var didClearAllData = false
    var receivedDeviceId: String?
    var newApiHelper: APITokenManagable?

    func dispatch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: GraphNetworkCachePolicy,
        completion: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void
    ) { }

    func dispatchMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        cacheResultToPersistence: Bool,
        completion: @escaping (Result<GraphQLResult<Mutation.Data>, Error>) -> Void
    ) { }

    func clearAllCachedData(completion: (() -> Void)?) {
        didClearAllData = true
    }

    func updateHeadersToNetworkTransport(deviceId: String, apiHelper: APITokenManagable) {
        receivedDeviceId = deviceId
        newApiHelper = apiHelper
    }
}

private final class SpyDiskCache: DiskCachable {

    var receivedDeletionStrategy: DiskCacheDeletionStrategy?

    func save(
        _ file: String,
        with fileName: String,
        fileCanBeExpired: Bool,
        expiresAt: Int64
    ) throws { }

    func readItem(with fileName: String, includeExpired: Bool) -> (file: String?, expired: Bool) {
        (file: nil, expired: false)
    }

    func readItems(with baseFileName: String) -> [String] {
        []
    }

    func deleteItem(with fileName: String) { }

    func clearItems(deletionStrategy: DiskCacheDeletionStrategy, completion: (() -> Void)?) {
        receivedDeletionStrategy = deletionStrategy
    }
}

private class URLSessionCacheCleanerSpy: URLSessionCacheCleaner {

    var removeAllCachedDataWasCalled = false

    override public func removeAllCachedData() {
        removeAllCachedDataWasCalled = true
    }
}
