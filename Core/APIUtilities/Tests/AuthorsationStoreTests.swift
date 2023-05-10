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

    var sut: AuthorisationStoring!
    private var oldKeychain: KeychainSubclassSpy!
    private var keychainSharing: KeychainSharingSubclassSpy!
    private let tokenKey = AuthorisationStore.KeychainKey.token.rawValue
    private let expiryKey = AuthorisationStore.KeychainKey.expiryDate.rawValue
    private let refreshTokenKey = AuthorisationStore.KeychainKey.refreshToken.rawValue
    private let refreshTokenExpiryKey = AuthorisationStore.KeychainKey.refreshTokenExpiryDate.rawValue
    private let keychainSharingId = "testKeychainSharingId"

    override func setUp() {
        self.oldKeychain = KeychainSubclassSpy()
        self.keychainSharing = KeychainSharingSubclassSpy()
        self.sut = AuthorisationStore(oldKeychain: oldKeychain, keychainSharing: keychainSharing, keychainSharingId: keychainSharingId, fromNotificationService: false)
    }

    func test_emptyStorage() {
        XCTAssertNil(sut.accessToken)
        XCTAssertFalse(sut.accessTokenValid)
    }

    func test_migrateExistedKeychainToKeychainSharing_whenKeychainSharingNotNil_shouldDeleteOldKeychain() {
        let existedToken = "existedToken"
        let _ = keychainSharing.set(existedToken, forKey: tokenKey)
        let keychainSharingSUT = AuthorisationStore(
            oldKeychain: oldKeychain,
            keychainSharing: keychainSharing,
            keychainSharingId: keychainSharingId,
            fromNotificationService: false)
        XCTAssertEqual(oldKeychain.mutatedKeyValues.count, 0)
    }

    func test_migrateExistedKeychainToKeychainSharing_whenKeychainSharingNil_shouldMigrateOldKeychain() {
        let existedToken = "existedToken"
        let _ = oldKeychain.set(existedToken, forKey: tokenKey)
        XCTAssertEqual(keychainSharing.mutatedKeyValues.count, 0)
        let keychainSharingSUT = AuthorisationStore(
            oldKeychain: oldKeychain,
            keychainSharing: keychainSharing,
            keychainSharingId: keychainSharingId,
            fromNotificationService: false)
        XCTAssertEqual(existedToken, keychainSharingSUT.accessToken)
    }

    func test_haveToken() {
        let testToken = "I_AM_TOKEN"
        keychainSharing.valuesToReturn[tokenKey] = testToken
        XCTAssertEqual(testToken, sut.accessToken)
    }

    func test_tokenValidity_valid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: 2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychainSharing.valuesToReturn[expiryKey] = futureDateString
        XCTAssertTrue(sut.accessTokenValid)
    }
 
    func test_tokenValidity_invalid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: -2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychainSharing.valuesToReturn[expiryKey] = futureDateString
        XCTAssertFalse(sut.accessTokenValid)
    }

    func test_haveRefreshToken() {
        let refreshToken = "REFRESH_TOKEN"
        keychainSharing.valuesToReturn[refreshTokenKey] = refreshToken
        XCTAssertEqual(sut.refreshToken, refreshToken)
    }

    func test_refreshTokenValidity_valid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: 2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychainSharing.valuesToReturn[refreshTokenExpiryKey] = futureDateString
        XCTAssertTrue(sut.refreshTokenValid)
    }

    func test_refreshTokenValidity_invalid() {
        let futureDate = Date().addingTimeInterval(TimeInterval(floatLiteral: -2000))
        let futureDateString = String(futureDate.toMilliseconds())
        keychainSharing.valuesToReturn[refreshTokenExpiryKey] = futureDateString
        XCTAssertFalse(sut.refreshTokenValid)
    }

    func test_saveCredentials_withNilRefreshToken() {
        let testToken = "THE_BEST_TOKEN"
        let testExpirySeconds = 1234
        let expectedExpiryInt = Date()
            .addingTimeInterval(Double(testExpirySeconds))
            .toMilliseconds()
        sut.saveCredentials(token: testToken, secondsExpiresIn: testExpirySeconds, refreshToken: nil)
        XCTAssertEqual(keychainSharing.mutatedKeyValues[tokenKey], testToken)
        // NOTE: The store will calculate its expiry value later than we make our expected result
        //       This means the expiry times can differ by 1ms, so we check for a range
        guard
            let resultString = keychainSharing.mutatedKeyValues[expiryKey],
            let resultExpiryInt = Int(resultString)
            else {
                return XCTFail("Token expiry was not an Int")
        }
        XCTAssertGreaterThan(Int(expectedExpiryInt + 2), resultExpiryInt)
        XCTAssertGreaterThan(resultExpiryInt, Int(expectedExpiryInt - 1))
    }

    func test_saveCredentials_withRefreshToken() {
        let testToken = "THE_BEST_TOKEN"
        let testExpirySeconds = 1234
        let expectedExpiryInt = Date()
            .addingTimeInterval(Double(testExpirySeconds))
            .toMilliseconds()
        sut.saveCredentials(token: testToken, secondsExpiresIn: testExpirySeconds, refreshToken: testToken)
        XCTAssertEqual(keychainSharing.mutatedKeyValues[tokenKey], testToken)
        XCTAssertEqual(keychainSharing.mutatedKeyValues[refreshTokenKey], testToken)
        // NOTE: The store will calculate its expiry value later than we make our expected result
        //       This means the expiry times can differ by 1ms, so we check for a range
        guard
            let resultString = keychainSharing.mutatedKeyValues[expiryKey],
            let resultExpiryInt = Int(resultString)
            else {
                return XCTFail("Token expiry was not an Int")
        }
        XCTAssertGreaterThan(Int(expectedExpiryInt + 2), resultExpiryInt)
        XCTAssertGreaterThan(resultExpiryInt, Int(expectedExpiryInt - 1))
    }

    func test_removeCredentials() {
        sut.removeCredentials()
        XCTAssertTrue(keychainSharing.deletedKeys.contains(tokenKey))
        XCTAssertTrue(keychainSharing.deletedKeys.contains(expiryKey))
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
        valuesToReturn[key] = value
        mutatedKeyValues[key] = value
        return true
    }
}

private final class KeychainSharingSubclassSpy: KeychainSwift {

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
        valuesToReturn[key] = value
        mutatedKeyValues[key] = value
        return true
    }
}
