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
    fileprivate static let keychain = KeychainSwift()

    enum KeychainKey: String {
        case token = "livestyled-token"
        case refreshToken = "livestyled-refreshToken"
        case expiryDate = "livestyled-tokenExpiryDate"
        case refreshTokenExpiryDate = "livestyled-refreshTokenExpiryDate"
    }

    static var performInitialUserAuthentication: Observable<Bool> {
        let standardResponse: Observable<Bool> = Observable.from(optional: true)
        guard let userId = UserProfileDataManager.sharedInstance.userProfile.userID else { return standardResponse }
        if !UserAuthenticator.refreshTokenValid {
            // TODO: We need to clear the token from wherever it's stored
            return standardResponse
        }
        return UserRepository.profile(withID: userId, forceUpdate: true) // This will force the access token to refresh if necessary
            .map { $0.id != nil }
            .catchError({ (error) -> Observable<Bool> in
                if let unAuthenticatedError = error as? APIError, unAuthenticatedError.unAuthenticated == true {
                    // TODO: We need to clear the token from wherever it's stored
                }
                return standardResponse
            })
    }

    //oAuth calls
    static var requestInitialAccessToken: Observable<Any?>? {
        guard accessTokenValid == false else { return nil }
        return OAuthSender.requestInitialAccessToken()
            .map {
                guard let accessToken = $0.accessToken, let expiresIn = $0.expiresIn else { return $0 }
                UserAuthenticator.saveCredentials(token: accessToken, refreshToken: nil, secondsExpiresIn: expiresIn)
                return $0
        }
    }

    static var refreshAccessToken: Observable<Any?>? {
        guard keychain.get(KeychainKey.token.rawValue) != nil, !accessTokenValid, let refreshTokenToSend = UserAuthenticator.refreshToken else { return nil }
        return OAuthSender.refreshAccessToken(refreshToken: refreshTokenToSend)
            .map { (token) -> String? in
                guard let accessToken = token.accessToken, let expiresIn = token.expiresIn else { return nil }
                UserAuthenticator.saveCredentials(token: accessToken, refreshToken: token.refreshToken, secondsExpiresIn: expiresIn)
                return accessToken
        }
    }

    //oAuth direct keychain access and manipulation
    static func saveCredentials(token: String, refreshToken: String?, secondsExpiresIn: Int) {  //Use this function instead of calling update(accessToken/refreshToken directly)
        update(accessToken: token, withSecondsExpiresIn: secondsExpiresIn)
        update(refreshToken: refreshToken)
    }

    static var accessToken: String? {
        return keychain.get(KeychainKey.token.rawValue)
    }

    static var refreshToken: String? {
        return keychain.get(KeychainKey.refreshToken.rawValue)
    }

    static var accessTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(KeychainKey.expiryDate.rawValue))
    }

    static var refreshTokenValid: Bool {
        return expiryDateValid(expiryDateString: keychain.get(KeychainKey.refreshTokenExpiryDate.rawValue))
    }

    static func update(refreshToken: String?, withSecondsExpiresIn seconds: Int? = nil) {
        guard let refreshToken = refreshToken else { return }
        keychain.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
        let nearlyFourteenDaysInSeconds = seconds ?? 1166400
        updateExpiryDate(ofKey: KeychainKey.refreshTokenExpiryDate, withSecondsExpiresIn: nearlyFourteenDaysInSeconds)
    }

    static func removeCredentials() {
        keychain.delete(KeychainKey.token.rawValue)
        keychain.delete(KeychainKey.refreshToken.rawValue)
        keychain.delete(KeychainKey.expiryDate.rawValue)
        keychain.delete(KeychainKey.refreshTokenExpiryDate.rawValue)
    }

    fileprivate static func expiryDateValid(expiryDateString: String?) -> Bool {
        guard let expiryDateString = expiryDateString, let timestamp = Int64(expiryDateString) else { return false }
        return Date().toMilliseconds() < timestamp
    }

    fileprivate static func update(accessToken: String?, withSecondsExpiresIn seconds: Int?) {
        guard let accessToken = accessToken else { return }
        keychain.set(accessToken, forKey: KeychainKey.token.rawValue)
        UserAuthenticator.updateExpiryDate(ofKey: KeychainKey.expiryDate, withSecondsExpiresIn: seconds)
    }

    fileprivate static func updateExpiryDate(ofKey key: KeychainKey, withSecondsExpiresIn seconds: Int?) {
        guard let seconds = seconds else { return }
        let expiryDate = "\(Date().addingTimeInterval(Double(seconds)).toMilliseconds())"
        keychain.set(expiryDate, forKey: key.rawValue)
    }
}

final class UserAuthenticatorBridge: NSObject {

    static func removeCredentials() {
        UserAuthenticator.removeCredentials()
    }

}
