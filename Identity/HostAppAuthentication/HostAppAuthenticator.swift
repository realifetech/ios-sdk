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

    func attemptLogin(userInfo: HostAppUserInfo, salt: String, completion: HostAppCompletion?) {
        // generate nonce
        // sign info
        // authenticateUserBySignedUserInfo
        // get reference to web view
        // call acceptAuthDetails
        // reload web view
        let signature = generateUserInfoSignature(userInfo: userInfo, salt: salt)
        generateNonce()
            .flatMap { nonce in
                self.authenticateUserBySignedUserInfo(nonce: nonce, signature: signature)
            }
        // need to call error completion if failed
    }

    public func generateNonce() -> Observable<String> {
        return Observable.from(optional: "a")
    }

    public func authenticateUserBySignedUserInfo(nonce: String, signature: String) -> Observable<[String: Any]> {
        return Observable.from(optional: ["token": "ascjn", "expires": 123])
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
}
