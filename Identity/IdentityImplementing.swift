//
//  IdentityImplementing.swift
//  RealifeTech
//
//  Created by Ross Patman on 14/09/2021.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public class IdentityImplementing: Identity {

    let hostAppAuthenticator: HostAppAuthenticating

    public init(hostAppAuthenticator: HostAppAuthenticating) {
        self.hostAppAuthenticator = hostAppAuthenticator
    }

    /// Can be used to determine if the deep link you have received was triggered by our ordering journey
    /// in order to prompt you to show your login flow.
    /// - Returns: Bool
    /// - Example:
    /// ```
    /// // Within AppDelegate
    /// func application(_ application: UIApplication, open url: URL, options: ...) -> Bool {
    ///     if RealifeTech.Identity.isHostAppLoginDeepLink(url: url) {
    ///         // trigger the host app login flow detailed in our documentation
    ///     }
    /// }
    /// ```
    public func isHostAppLoginDeepLink(url: URL?) -> Bool {
        return (url?.absoluteString ?? "").contains("rlthostapplogin")
    }

    /// Can be used to determine if the deep link you have received was triggered by our ordering journey
    /// in order to prompt you to show your login flow.
    /// - Returns: Void
    /// - Example:
    /// ```
    ///
    /// RealifeTech.Identity.attemptLogin(emailAddress: String,
    ///                                     firstName: String?,
    ///                                     lastName: String?,
    ///                                     salt: String,
    ///                                     completion: (success: Bool, errorMessage: String?))
    /// ```
    public func attemptLogin(emailAddress: String,
                             firstName: String?,
                             lastName: String?,
                             salt: String,
                             completion: (success: Bool, errorMessage: String?)) {
        print("called")
    }
}
