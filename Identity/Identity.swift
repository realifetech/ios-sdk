//
//  Identity.swift
//  RealifeTech
//
//  Created by Ross Patman on 14/09/2021.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol Identity {
    func isHostAppLoginDeepLink(url: URL?) -> Bool
    func attemptLogin(emailAddress: String,
                      firstName: String?,
                      lastName: String?,
                      salt: String,
                      completion: @escaping (Error?) -> Void)
    func logout()
}
