//
//  UserAuthenticator.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 06/06/2016.
//  Copyright © 2016 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift

/// Used to store authorisation tokens
protocol AuthorisationStoring {
    var accessToken: String? { get }
    var accessTokenValid: Bool { get }
    var refreshToken: String? { get }
    var refreshTokenValid: Bool { get }

    func saveCredentials(token: String, secondsExpiresIn: Int, refreshToken: String?)
    func removeCredentials()
}

/// Implements a secure (keychain based) storage for token storage
struct AuthorisationStore: AuthorisationStoring {

    enum KeychainKey: String, CaseIterable {
        case token = "realifetech-token"
        case expiryDate = "realifetech-tokenExpiryDate"
        case refreshToken = "realifetech-refreshToken"
        case refreshTokenExpiryDate = "realifetech-refreshTokenExpiryDate"
    }

    private let clientId: String
    private let keychain: KeychainSwift

    init(clientId: String, keychain: KeychainSwift = KeychainSwift()) {
        self.clientId = clientId
        self.keychain = keychain
    }

    var accessToken: String? {
        return keychain.get(getKeychainKey(.token))
    }

    var accessTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(getKeychainKey(.expiryDate)))
    }

    var refreshToken: String? {
        return keychain.get(getKeychainKey(.refreshToken))
    }

    var refreshTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(getKeychainKey(.refreshTokenExpiryDate)))
    }

    func saveCredentials(token: String, secondsExpiresIn: Int, refreshToken: String?) {
        update(accessToken: token, withSecondsExpiresIn: secondsExpiresIn)
        update(refreshToken: refreshToken, withSecondsExpiresIn: secondsExpiresIn)
    }

    func removeCredentials() {
        KeychainKey.allCases.forEach {
            keychain.delete(getKeychainKey($0))
        }
    }

    private func getKeychainKey(_ type: KeychainKey) -> String {
        return clientId + "-" + type.rawValue
    }

    private func update(accessToken: String, withSecondsExpiresIn seconds: Int) {
        let expiryDate = "\(Date().addingTimeInterval(Double(seconds)).toMilliseconds())"
        keychain.set(accessToken, forKey: getKeychainKey(.token))
        keychain.set(expiryDate, forKey: getKeychainKey(.expiryDate))
    }

    private func update(refreshToken: String?, withSecondsExpiresIn seconds: Int?) {
        guard let refreshToken = refreshToken else { return }
        keychain.set(refreshToken, forKey: getKeychainKey(.refreshToken))
        let nearlyFourteenDaysInSeconds = seconds ?? 1166400
        let expiryDate = "\(Date().addingTimeInterval(Double(nearlyFourteenDaysInSeconds)).toMilliseconds())"
        keychain.set(expiryDate, forKey: getKeychainKey(.refreshTokenExpiryDate))
    }

    private func expiryDateValid(expiryDateString: String?) -> Bool {
        guard let expiryDateString = expiryDateString, let timestamp = Int64(expiryDateString) else { return false }
        return Date().toMilliseconds() < timestamp
    }
}
