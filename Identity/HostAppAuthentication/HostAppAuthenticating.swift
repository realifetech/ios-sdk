//
//  HostAppAuthenticating.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 15/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct HostAppUserInfo {
    let emailAddress: String
    let firstName: String?
    let lastName: String?
}

public typealias HostAppLoginCompletion = (Error?) -> Void

public protocol HostAppAuthenticating {
    func attemptLogin(userInfo: HostAppUserInfo, salt: String, completion: @escaping HostAppLoginCompletion)
}
