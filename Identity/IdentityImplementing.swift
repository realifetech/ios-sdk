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

    public init() { }

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
}
