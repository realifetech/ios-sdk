//
//  HostAppLoginDataProviding.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

typealias GenerateNonceHandler = (Result<String, Error>) -> Void
typealias AuthenticateUserHandler = (Result<OAuthToken, Error>) -> Void
typealias AuthenticateWebViewHandler = (Any?, Error?) -> Void

protocol HostAppLoginDataProviding {
    func generateNonce(completion: GenerateNonceHandler)
    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: AuthenticateUserHandler)
}
