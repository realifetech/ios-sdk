//
//  HostAppLoginDataProviding.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

typealias StringResultHandler = (Result<String, Error>) -> Void
typealias GetDeviceIdHandler = StringResultHandler
typealias GenerateNonceHandler = StringResultHandler
typealias AuthenticateUserHandler = (Result<OAuthToken, Error>) -> Void
typealias AuthenticateWebViewHandler = (Any?, Error?) -> Void

protocol HostAppLoginDataProviding {
    func getDeviceId(completion: @escaping GetDeviceIdHandler)
    func generateNonce(completion: @escaping GenerateNonceHandler)
    func authenticateUserBySignedUserInfo(userInfo: HostAppUserInfo,
                                          salt: String,
                                          nonce: String,
                                          signature: String,
                                          completion: @escaping AuthenticateUserHandler)
}
