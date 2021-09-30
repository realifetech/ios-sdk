//
//  HostAppAuthenticator.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 15/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

class HostAppAuthenticator: HostAppAuthenticating {

    private let hostAppLoginDataProvider: HostAppLoginDataProviding
    private let orderingJourneyViewUpdater: OrderingJourneyViewUpdating
    private var userInfo: HostAppUserInfo!
    private var salt: String!
    private var signature: String!
    private var completion: HostAppLoginCompletion!

    public init(hostAppLoginDataProvider: HostAppLoginDataProviding,
                orderingJourneyViewUpdater: OrderingJourneyViewUpdating) {
        self.hostAppLoginDataProvider = hostAppLoginDataProvider
        self.orderingJourneyViewUpdater = orderingJourneyViewUpdater
    }

    func attemptLogin(userInfo: HostAppUserInfo, salt: String, completion: @escaping HostAppLoginCompletion) {
        self.userInfo = userInfo
        self.salt = salt
        self.completion = completion
        let webViewHandler = authenticateWebViewHandler()
        let userHandler = authenticateUserHandler(next: webViewHandler)
        let nonceHandler = generateNonceHandler(next: userHandler)
        let deviceIdHandler = getDeviceIdHandler(next: nonceHandler)
        hostAppLoginDataProvider.getDeviceId(completion: deviceIdHandler)
    }

    private func getDeviceIdHandler(next: @escaping GenerateNonceHandler) -> GetDeviceIdHandler {
        return { result in
            switch result {
            case .success(let deviceId):
                self.signature = self.generateUserInfoSignature(userInfo: self.userInfo,
                                                                salt: self.salt,
                                                                deviceId: deviceId)
                self.hostAppLoginDataProvider.generateNonce(completion: next)
            case.failure(let error):
                self.completion(error)
            }
        }
    }

    public func generateUserInfoSignature(userInfo: HostAppUserInfo, salt: String, deviceId: String) -> String {
        var userInfoDict: [String: String] = ["email": userInfo.emailAddress]
        if let firstName = userInfo.firstName { userInfoDict["firstName"] = firstName }
        if let lastName = userInfo.lastName { userInfoDict["lastName"] = lastName }
        userInfoDict["device"] = deviceId
        let sorted = userInfoDict.sorted { one, two in
            return one.key < two.key
        }
        let description = "{" + (sorted.map { "\"\($0.key)\":\"\($0.value)\"" }.joined(separator: ",")) + "}"
        let urlAllowed: CharacterSet = .alphanumerics.union(.init(charactersIn: "-._~"))
        guard let encoded = description.addingPercentEncoding(withAllowedCharacters: urlAllowed) else { return "" }
        return "\(encoded).\(salt)".sha256.lowercased()
    }

    private func generateNonceHandler(next: @escaping AuthenticateUserHandler) -> GenerateNonceHandler {
        return { result in
            switch result {
            case .success(let nonce):
                self.hostAppLoginDataProvider.authenticateUserBySignedUserInfo(userInfo: self.userInfo,
                                                                               salt: self.salt,
                                                                               nonce: nonce,
                                                                               signature: self.signature,
                                                                               completion: next)
            case.failure(let error):
                self.completion(error)
            }
        }
    }

    private func authenticateUserHandler(next: @escaping AuthenticateWebViewHandler) -> AuthenticateUserHandler {
        return { result in
            switch result {
            case .success(let token):
                let javascript = self.constructJavascript(token: token)
                self.orderingJourneyViewUpdater.evaluate(javascript: javascript,
                                                         reloadOnSuccess: true,
                                                         completion: next)
            case.failure(let error):
                self.completion(error)
            }
        }
    }

    private func authenticateWebViewHandler() -> AuthenticateWebViewHandler {
        return { _, error in
            self.completion(error)
        }
    }

    private func constructJavascript(token: OAuthToken) -> String {
        guard let accessToken = token.accessToken,
              let refreshToken = token.refreshToken,
              let expiresIn = token.expiresIn,
              let tokenType = token.tokenType else { return "" }
        return "acceptAuthDetails('\(accessToken)', '\(refreshToken)', \(expiresIn), '\(tokenType)')"
    }
}
