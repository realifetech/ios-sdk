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
//    private weak var webView: WKWebView
    private var userInfo: HostAppUserInfo!
    private var salt: String!
    private var signature: String!
    private var completion: HostAppLoginCompletion!

    public init(hostAppLoginDataProvider: HostAppLoginDataProviding) {
        self.hostAppLoginDataProvider = hostAppLoginDataProvider
    }

    // sign info
    // generate nonce
    // authenticateUserBySignedUserInfo
    // call acceptAuthDetails on web view
    // reload web view
    func attemptLogin(userInfo: HostAppUserInfo, salt: String, completion: @escaping HostAppLoginCompletion) {
        self.userInfo = userInfo
        self.salt = salt
        self.completion = completion
        self.signature = generateUserInfoSignature(userInfo: userInfo, salt: salt)
        hostAppLoginDataProvider.generateNonce(completion: generateNonceHandler(next: authenticateUserHandler()))
    }

    public func generateUserInfoSignature(userInfo: HostAppUserInfo, salt: String) -> String {
        var userInfoDict: [String: String] = ["emailAddress": userInfo.emailAddress]
        if let firstName = userInfo.firstName { userInfoDict["firstName"] = firstName }
        if let lastName = userInfo.lastName { userInfoDict["lastName"] = lastName }
        let sorted = userInfoDict.sorted { one, two in
            return one.key < two.key
        }
        let description = "{" + (sorted.map { "\"\($0.key)\":\"\($0.value)\"" }.joined(separator: ",")) + "}"
        let urlAllowed: CharacterSet = .alphanumerics.union(.init(charactersIn: "-._~"))
        guard let encoded = description.addingPercentEncoding(withAllowedCharacters: urlAllowed) else { return "" }
        return "\(encoded).\(salt)".sha256
    }

    private func generateNonceHandler(next: @escaping AuthenticateUserBySignedUserInfoHandler) -> GenerateNonceHandler {
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

    private func authenticateUserHandler(next: (Error?) -> Void) -> AuthenticateUserBySignedUserInfoHandler {
        return { result in
            switch result {
            case .success(let token):
                // pass to web view and reload
                break
            case.failure(let error):
                self.completion(error)
            }
        }
    }
}
