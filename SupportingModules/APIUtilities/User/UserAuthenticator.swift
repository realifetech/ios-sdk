//
//  UserAuthenticator.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 06/06/2016.
//  Copyright © 2016 ConcertLive. All rights reserved.
//
import Foundation
import APILayer
import RxSwift

struct UserAuthenticator {

    enum KeychainKey: String {
        case token = "livestyled-token"
        case refreshToken = "livestyled-refreshToken"
        case expiryDate = "livestyled-tokenExpiryDate"
        case refreshTokenExpiryDate = "livestyled-refreshTokenExpiryDate"
    }

    private static let keychain = KeychainSwift()

    static var accessToken: String? {
        return keychain.get(KeychainKey.token.rawValue)
    }

    static var accessTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(KeychainKey.expiryDate.rawValue))
    }

    //oAuth calls
    static var requestInitialAccessToken: Observable<Any?>? {
        guard accessTokenValid == false else { return nil }
        return OAuthSender.requestInitialAccessToken()
            .map { (token: OAuthToken) -> OAuthToken in
                if let accessToken = token.accessToken, let expiresIn = token.expiresIn {
                    UserAuthenticator.saveCredentials(
                        token: accessToken,
                        secondsExpiresIn: expiresIn)
                }
                return token
        }
    }

    //oAuth direct keychain access and manipulation

    /// Use this function instead of calling update(accessToken/refreshToken directly)
    static func saveCredentials(token: String, secondsExpiresIn: Int) {
        update(accessToken: token, withSecondsExpiresIn: secondsExpiresIn)
    }

    static func removeCredentials() {
        keychain.delete(KeychainKey.token.rawValue)
        keychain.delete(KeychainKey.expiryDate.rawValue)
    }

    private static func expiryDateValid(expiryDateString: String?) -> Bool {
        guard let expiryDateString = expiryDateString, let timestamp = Int64(expiryDateString) else { return false }
        return Date().toMilliseconds() < timestamp
    }

    private static func update(accessToken: String, withSecondsExpiresIn seconds: Int) {
        let expiryDate = "\(Date().addingTimeInterval(Double(seconds)).toMilliseconds())"
        keychain.set(accessToken, forKey: KeychainKey.token.rawValue)
        keychain.set(expiryDate, forKey: KeychainKey.expiryDate.rawValue)
    }
}
