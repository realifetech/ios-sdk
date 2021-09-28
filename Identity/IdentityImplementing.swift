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

    public let hostAppAuthenticator: HostAppAuthenticating
    public let identityClearer: IdentityClearing

    public init(hostAppAuthenticator: HostAppAuthenticating, identityClearer: IdentityClearing) {
        self.hostAppAuthenticator = hostAppAuthenticator
        self.identityClearer = identityClearer
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

    /// Used to authenticate a user on our system, creating a new user if one doesn't exist.
    /// A missing/present error in the completion signals success/failure.
    /// - Returns: Void
    /// - Example:
    /// ```
    /// RealifeTech.Identity.attemptLogin(emailAddress: String,
    ///                                     firstName: String?,
    ///                                     lastName: String?,
    ///                                     salt: String,
    ///                                     completion: (Error?) -> Void)
    /// ```
    public func attemptLogin(emailAddress: String,
                             firstName: String?,
                             lastName: String?,
                             salt: String,
                             completion: @escaping (Error?) -> Void) {
        let userInfo = HostAppUserInfo(emailAddress: emailAddress, firstName: firstName, lastName: lastName)
        hostAppAuthenticator.attemptLogin(userInfo: userInfo, salt: salt, completion: completion)
    }

    /// Used to clear user data from the SDK after they have logged out from your apps
    /// - Returns: Void
    /// - Example:
    /// ```
    /// RealifeTech.Identity.logout()
    /// ```
    public func logout() {
        print("logout")
        identityClearer.clearIdentity(completion: nil)
    }
}
