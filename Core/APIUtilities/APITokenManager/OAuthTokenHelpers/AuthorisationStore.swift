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

    enum KeychainKey: String {
        case token = "livestyled-token"
        case expiryDate = "livestyled-tokenExpiryDate"
        case refreshToken = "livestyled-refreshToken"
        case refreshTokenExpiryDate = "livestyled-refreshTokenExpiryDate"
    }

    /// AVS-621 Before enabling Keychain Sharing capability for Notification Service Extension, we were using default KeychainSwift() to save credentials.
    /// However, after enabling Keychain Sharing, we need to migrate the existed credential that saved in old Keychain(without access group) to new Keychain(with access group).
    /// By calling `migrateExistedCredentialsToKeychainSharing` function when initializing the AuthorisationStore class.
    private let oldKeychain: KeychainSwift
    private let keychainSharing: KeychainSwift

    init(oldKeychain: KeychainSwift = KeychainSwift(),
         keychainSharing: KeychainSwift = KeychainSwift(),
         keychainSharingId: String?) {
        self.oldKeychain = oldKeychain
        self.keychainSharing = keychainSharing
        self.keychainSharing.synchronizable = true
        self.keychainSharing.accessGroup = keychainSharingId
        migrateExistedCredentialsToKeychainSharingIfNeeded()
    }

    var accessToken: String? {
        return keychainSharing.get(KeychainKey.token.rawValue)
    }

    var accessTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychainSharing.get(KeychainKey.expiryDate.rawValue))
    }

    var refreshToken: String? {
        return keychainSharing.get(KeychainKey.refreshToken.rawValue)
    }

    var refreshTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychainSharing.get(KeychainKey.refreshTokenExpiryDate.rawValue))
    }

    func saveCredentials(token: String, secondsExpiresIn: Int, refreshToken: String?) {
        update(accessToken: token, withSecondsExpiresIn: secondsExpiresIn)
        update(refreshToken: refreshToken, withSecondsExpiresIn: secondsExpiresIn)
    }

    func removeCredentials() {
        keychainSharing.delete(KeychainKey.token.rawValue)
        keychainSharing.delete(KeychainKey.expiryDate.rawValue)
        keychainSharing.delete(KeychainKey.refreshToken.rawValue)
        keychainSharing.delete(KeychainKey.refreshTokenExpiryDate.rawValue)
    }

    private func update(accessToken: String, withSecondsExpiresIn seconds: Int) {
        let expiryDate = "\(Date().addingTimeInterval(Double(seconds)).toMilliseconds())"
        keychainSharing.set(accessToken, forKey: KeychainKey.token.rawValue)
        keychainSharing.set(expiryDate, forKey: KeychainKey.expiryDate.rawValue)
    }

    private func update(refreshToken: String?, withSecondsExpiresIn seconds: Int?) {
        guard let refreshToken = refreshToken else { return }
        keychainSharing.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
        let nearlyFourteenDaysInSeconds = seconds ?? 1166400
        let expiryDate = "\(Date().addingTimeInterval(Double(nearlyFourteenDaysInSeconds)).toMilliseconds())"
        keychainSharing.set(expiryDate, forKey: KeychainKey.refreshTokenExpiryDate.rawValue)
    }

    private func expiryDateValid(expiryDateString: String?) -> Bool {
        guard let expiryDateString = expiryDateString, let timestamp = Int64(expiryDateString) else { return false }
        return Date().toMilliseconds() < timestamp
    }

    private func migrateExistedCredentialsToKeychainSharingIfNeeded() {
        if let oldAccessToken = oldKeychain.get(KeychainKey.token.rawValue) {
            keychainSharing.set(oldAccessToken, forKey: KeychainKey.token.rawValue)
            oldKeychain.delete(KeychainKey.token.rawValue)
        }
        if let oldExpiryDate = oldKeychain.get(KeychainKey.expiryDate.rawValue) {
            keychainSharing.set(oldExpiryDate, forKey: KeychainKey.expiryDate.rawValue)
            oldKeychain.delete(KeychainKey.expiryDate.rawValue)
        }
        if let oldRefreshToken = oldKeychain.get(KeychainKey.refreshToken.rawValue) {
            keychainSharing.set(oldRefreshToken, forKey: KeychainKey.refreshToken.rawValue)
            oldKeychain.delete(KeychainKey.refreshToken.rawValue)
        }
        if let oldRefreshTokenExpiryDate = oldKeychain.get(KeychainKey.refreshTokenExpiryDate.rawValue) {
            keychainSharing.set(oldRefreshTokenExpiryDate, forKey: KeychainKey.refreshTokenExpiryDate.rawValue)
            oldKeychain.delete(KeychainKey.refreshTokenExpiryDate.rawValue)
        }
    }
}
