//
//  AuthorsationStoreTests.swift
//  APIV3Utilities
//
//  Created by Olivier Butler on 08/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import XCTest
@testable import RealifeTech

final class AuthorisationStoreTests: XCTestCase {

    var sut: AuthorisationStoring!
    private var keychain: KeychainSubclassSpy!
    let tokenKey = AuthorisationStore.KeychainKey.token.rawValue
    let expiryKey = AuthorisationStore.KeychainKey.expiryDate.rawValue

    override func setUp() {
        self.keychain = KeychainSubclassSpy()
        self.sut = AuthorisationStore(keychain: keychain)
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

    func test_saveCredentials() {
        let testToken = "THE_BEST_TOKEN"
        let testExpirySeconds = 1234
        let expectedExpiryInt = Date()
            .addingTimeInterval(Double(testExpirySeconds))
            .toMilliseconds()
        sut.saveCredentials(token: testToken, secondsExpiresIn: testExpirySeconds)
        XCTAssertEqual(keychain.mutatedKeyValues[tokenKey], testToken)
        // Note: The store will calculate its expiry value later than we make our expected result
        //       This means the expiry times can differ by 1ms, so we check for a range
        guard
            let resultString = keychain.mutatedKeyValues[expiryKey],
            let resultExpiryInt = Int(resultString)
            else {
                return XCTFail("Token expiry was not an Int")
        }
        XCTAssertGreaterThan(Int(expectedExpiryInt + 2), resultExpiryInt)
        XCTAssertGreaterThan(resultExpiryInt, Int(expectedExpiryInt - 1))
    }

    func test_removeCredentials() {
        sut.removeCredentials()
        XCTAssertTrue(keychain.deletedKeys.contains(tokenKey))
        XCTAssertTrue(keychain.deletedKeys.contains(expiryKey))
    }
}

private class KeychainSubclassSpy: KeychainSwift {
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

    override func set(_ value: String, forKey key: String, withAccess access: KeychainSwiftAccessOptions? = nil) -> Bool {
        mutatedKeyValues[key] = value
        return true
    }
}
