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

class KeychainProvider {

    var keychain: KeychainSwift {
        return getKeychain()
    }

    private let defaultKeychain: KeychainSwift
    private let keychainSharing: KeychainSwift
    private let appGroupStore: AppGroupUserDefaultsStore?
    private var hasAlreadyMigrated: Bool {
        appGroupStore?.fetchHasMigratedKeychain() ?? false
    }

    private let bundleTarget: BundleTarget

    init(from bundleTarget: BundleTarget,
         defaultKeychain: KeychainSwift = KeychainSwift(),
         keychainSharing: KeychainSwift = KeychainSwift(),
         keychainSharingId: String?,
         appGroupStore: AppGroupUserDefaultsStore?
    ) {
        self.bundleTarget = bundleTarget
        self.defaultKeychain = defaultKeychain
        self.keychainSharing = keychainSharing
        self.keychainSharing.synchronizable = true
        self.keychainSharing.accessGroup = keychainSharingId
        self.appGroupStore = appGroupStore
    }

    private func getKeychain() -> KeychainSwift {
        if hasAlreadyMigrated {
            return keychainSharing
        } else if case .notificationServiceExtension = bundleTarget { // Can be deprecated in the future
            return defaultKeychain
        } else {
            migrateDefaultCredentialsToKeychainSharing()
            appGroupStore?.saveHasMigratedKeychain(true)
            return keychainSharing
        }
    }

    private func migrateDefaultCredentialsToKeychainSharing() {
        if let accessToken = defaultKeychain.get(AuthorisationStore.KeychainKey.token.rawValue) {
            keychainSharing.set(accessToken, forKey: AuthorisationStore.KeychainKey.token.rawValue)
        }
        if let refreshToken = defaultKeychain.get(AuthorisationStore.KeychainKey.refreshToken.rawValue) {
            keychainSharing.set(refreshToken, forKey: AuthorisationStore.KeychainKey.refreshToken.rawValue)
        }
        if let expiryDate = defaultKeychain.get(AuthorisationStore.KeychainKey.expiryDate.rawValue) {
            keychainSharing.set(expiryDate, forKey: AuthorisationStore.KeychainKey.expiryDate.rawValue)
        }
        if let refreshTokenExpiryDate = defaultKeychain.get(AuthorisationStore.KeychainKey.refreshTokenExpiryDate.rawValue) {
            keychainSharing.set(refreshTokenExpiryDate, forKey: AuthorisationStore.KeychainKey.refreshTokenExpiryDate.rawValue)
        }
    }
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
//    private let defaultKeychain: KeychainSwift
//    private let keychainSharing: KeychainSwift
    private let keychain: KeychainSwift

    init(keychainProvider: KeychainProvider
//         defaultKeychain: KeychainSwift = KeychainSwift(),
//         keychainSharing: KeychainSwift = KeychainSwift(),
//         keychainSharingId: String?,
//         fromNotificationService: Bool
    ) {
        self.keychain = keychainProvider.keychain
//        self.defaultKeychain = defaultKeychain // For NSE
//        self.keychainSharing = keychainSharing
//        self.keychainSharing.synchronizable = true
//        self.keychainSharing.accessGroup = keychainSharingId

        // Do not migrate keychain when it's from NSE. Only do keychain migration when init from main target.
//        if fromNotificationService {
//            if keychainSharing.get(KeychainKey.token.rawValue) != nil { // means has already migrated
//                self.keychain = keychainSharing
//            } else {
//                self.keychain = defaultKeychain
//            }
//        } else {
//            migrateDefaultCredentialsToKeychainSharing()
//            self.keychain = keychainSharing
//        }
    }

    var accessToken: String? {
        return keychain.get(KeychainKey.token.rawValue)
    }

    var accessTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(KeychainKey.expiryDate.rawValue))
    }

    var refreshToken: String? {
        return keychain.get(KeychainKey.refreshToken.rawValue)
    }

    var refreshTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(KeychainKey.refreshTokenExpiryDate.rawValue))
    }

    func saveCredentials(token: String, secondsExpiresIn: Int, refreshToken: String?) {
        update(accessToken: token, withSecondsExpiresIn: secondsExpiresIn)
        update(refreshToken: refreshToken, withSecondsExpiresIn: secondsExpiresIn)
    }

    func removeCredentials() {
        keychain.delete(KeychainKey.token.rawValue)
        keychain.delete(KeychainKey.expiryDate.rawValue)
        keychain.delete(KeychainKey.refreshToken.rawValue)
        keychain.delete(KeychainKey.refreshTokenExpiryDate.rawValue)
    }

    private func update(accessToken: String, withSecondsExpiresIn seconds: Int) {
        let expiryDate = "\(Date().addingTimeInterval(Double(seconds)).toMilliseconds())"
        keychain.set(accessToken, forKey: KeychainKey.token.rawValue)
        keychain.set(expiryDate, forKey: KeychainKey.expiryDate.rawValue)
    }

    private func update(refreshToken: String?, withSecondsExpiresIn seconds: Int?) {
        guard let refreshToken = refreshToken else { return }
        keychain.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
        let nearlyFourteenDaysInSeconds = seconds ?? 1166400
        let expiryDate = "\(Date().addingTimeInterval(Double(nearlyFourteenDaysInSeconds)).toMilliseconds())"
        keychain.set(expiryDate, forKey: KeychainKey.refreshTokenExpiryDate.rawValue)
    }

    private func expiryDateValid(expiryDateString: String?) -> Bool {
        guard let expiryDateString = expiryDateString, let timestamp = Int64(expiryDateString) else { return false }
        return Date().toMilliseconds() < timestamp
    }

//    private func migrateDefaultCredentialsToKeychainSharing() {
//        if let accessToken = defaultKeychain.get(KeychainKey.token.rawValue) {
//            keychainSharing.set(accessToken, forKey: KeychainKey.token.rawValue)
//        }
//        if let refreshToken = defaultKeychain.get(KeychainKey.refreshToken.rawValue) {
//            keychainSharing.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
//        }
//        if let expiryDate = defaultKeychain.get(KeychainKey.expiryDate.rawValue) {
//            keychainSharing.set(expiryDate, forKey: KeychainKey.expiryDate.rawValue)
//        }
//        if let refreshTokenExpiryDate = defaultKeychain.get(KeychainKey.refreshTokenExpiryDate.rawValue) {
//            keychainSharing.set(refreshTokenExpiryDate, forKey: KeychainKey.refreshTokenExpiryDate.rawValue)
//        }
//    }
}
