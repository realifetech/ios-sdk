//
//  AuthorsationStoreTests.swift
//  APIUtilities
//
//  Created by Olivier Butler on 08/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AuthorisationStoreTests: XCTestCase {

    private var sut: AuthorisationStoring!
    private var keychain: KeychainSubclassSpy!
    private let clientId = "id"
    private lazy var tokenKey = clientId + "-" + AuthorisationStore.KeychainKey.token.rawValue
    private lazy var expiryKey = clientId + "-" + AuthorisationStore.KeychainKey.expiryDate.rawValue
    private lazy var refreshTokenKey = clientId + "-" + AuthorisationStore.KeychainKey.refreshToken.rawValue
    private lazy var refreshTokenExpiryKey = clientId + "-" + AuthorisationStore.KeychainKey.refreshTokenExpiryDate.rawValue

    override func setUp() {
        super.setUp()
        keychain = KeychainSubclassSpy()
        sut = AuthorisationStore(clientId: clientId, keychain: keychain)
    }

    override func tearDown() {
        keychain = nil
        sut = nil
        super.tearDown()
    }

    func test_emptyStorage() {
        XCTAssertNil(sut.accessToken)
        XCTAssertFalse(sut.accessTokenValid)
    }

    func test_haveToken() {
        let testToken = "I_AM_TOKEN"
        keychain.valuesToReturn[tokenKey] = testToken
        XCTAssertEqual(testToken, sut.accessToken)
    }

    func test_tokenValidity_valid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: 2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychain.valuesToReturn[expiryKey] = futureDateString
        XCTAssertTrue(sut.accessTokenValid)
    }

    func test_tokenValidity_invalid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: -2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychain.valuesToReturn[expiryKey] = futureDateString
        XCTAssertFalse(sut.accessTokenValid)
    }

    func test_haveRefreshToken() {
        let refreshToken = "REFRESH_TOKEN"
        keychain.valuesToReturn[refreshTokenKey] = refreshToken
        XCTAssertEqual(sut.refreshToken, refreshToken)
    }

    func test_refreshTokenValidity_valid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: 2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychain.valuesToReturn[refreshTokenExpiryKey] = futureDateString
        XCTAssertTrue(sut.refreshTokenValid)
    }

    func test_refreshTokenValidity_invalid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: -2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychain.valuesToReturn[refreshTokenExpiryKey] = futureDateString
        XCTAssertFalse(sut.refreshTokenValid)
    }

    func test_saveCredentials_withNilRefreshToken() throws {
        let testToken = "THE_BEST_TOKEN"
        let testExpirySeconds = 1234
        let expectedExpiryInt = Date()
            .addingTimeInterval(Double(testExpirySeconds))
            .toMilliseconds()
        sut.saveCredentials(token: testToken, secondsExpiresIn: testExpirySeconds, refreshToken: nil)
        XCTAssertEqual(keychain.mutatedKeyValues[tokenKey], testToken)
        // Note: The store will calculate its expiry value later than we make our expected result
        //       This means the expiry times can differ by 1ms, so we check for a range
        let resultString = try XCTUnwrap(keychain.mutatedKeyValues[expiryKey])
        let resultExpiryInt = try XCTUnwrap(Int(resultString))
        XCTAssertGreaterThan(Int(expectedExpiryInt + 2), resultExpiryInt)
        XCTAssertGreaterThan(resultExpiryInt, Int(expectedExpiryInt - 1))
    }

    func test_saveCredentials_withRefreshToken() throws {
        let testToken = "THE_BEST_TOKEN"
        let testExpirySeconds = 1234
        let expectedExpiryInt = Date()
            .addingTimeInterval(Double(testExpirySeconds))
            .toMilliseconds()
        sut.saveCredentials(token: testToken, secondsExpiresIn: testExpirySeconds, refreshToken: testToken)
        XCTAssertEqual(keychain.mutatedKeyValues[tokenKey], testToken)
        XCTAssertEqual(keychain.mutatedKeyValues[refreshTokenKey], testToken)
        // Note: The store will calculate its expiry value later than we make our expected result
        //       This means the expiry times can differ by 1ms, so we check for a range
        let resultString = try XCTUnwrap(keychain.mutatedKeyValues[expiryKey])
        let resultExpiryInt = try XCTUnwrap(Int(resultString))
        XCTAssertGreaterThan(Int(expectedExpiryInt + 2), resultExpiryInt)
        XCTAssertGreaterThan(resultExpiryInt, Int(expectedExpiryInt - 1))
    }

    func test_removeCredentials() {
        sut.removeCredentials()
        XCTAssertTrue(keychain.deletedKeys.contains(tokenKey))
        XCTAssertTrue(keychain.deletedKeys.contains(expiryKey))
    }
}

private final class KeychainSubclassSpy: KeychainSwift {

    var deletedKeys: [String] = []
    var retrievedKeys: [String] = []
    var mutatedKeyValues: [String: String] = [:]
    var valuesToReturn: [String: String] = [:]

    override func delete(_ key: String) -> Bool {
        deletedKeys.append(key)
        return true
    }

    override func get(_ key: String) -> String? {
        retrievedKeys.append(key)
        return valuesToReturn[key]
    }

    override func set(
        _ value: String,
        forKey key: String,
        withAccess access: KeychainSwiftAccessOptions? = nil
    ) -> Bool {
        mutatedKeyValues[key] = value
        return true
    }
}
