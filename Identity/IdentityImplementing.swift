//
//  IdentityImplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class IdentityImplementing: Identity {

    private let analyticsLogger: Analytics
    private let identityPersister: IdentityPersisting

    public let ssoProvider: SSOProvidable

    init(analyticsLogger: Analytics,
         identityPersister: IdentityPersisting,
         ssoProvider: SSOProvidable) {
        self.analyticsLogger = analyticsLogger
        self.identityPersister = identityPersister
        self.ssoProvider = ssoProvider
    }

    /// Identify the user to our system, along with any traits known about them
    /// - Example:
    /// ```
    /// RealifeTech.Identity.identify("1234", [.firstName: "John"])
    /// ```
    public func identify(userId: String,
                         traits: [RLTTraitType: Any],
                         completion: ((Result<Bool, Error>) -> Void)?) {
        identityPersister.persist(userId: userId)
        let stringKeyTraits: [String: Any] = Dictionary(uniqueKeysWithValues: traits.map { key, value in
                                                            (key.stringValue, value)
                                                        })
        logEvent(.identify, new: stringKeyTraits, completion: completion)
    }

    /// Link the current user (as identified previously) to the id of an external system
    /// - Example:
    /// ```
    /// RealifeTech.Identity.alias(.ticketmasterAccountId, "5678")
    /// ```
    public func alias(aliasType: RLTAliasType,
                      aliasId: String,
                      completion: ((Result<Bool, Error>) -> Void)?) {
        logEvent(.alias, new: [aliasType.stringValue: aliasId], completion: completion)
    }

    /// Clears the current user so analytics can be sent for a non-logged-in user. Can be used after your users log out.
    /// - Example:
    /// ```
    /// RealifeTech.Identity.clear()
    /// ```
    public func clear() {
        identityPersister.clear()
    }

    private enum AnalyticEventAction: String {
        case identify, alias
    }

    private func logEvent(_ action: AnalyticEventAction,
                          new: [String: Any],
                          completion: ((Result<Bool, Error>) -> Void)?) {
        let event = AnalyticEvent(type: "user", action: action.rawValue, new: new, version: "TODO-make-optional")
        analyticsLogger.logEvent(event, completion: completion ?? {_ in})
    }
}
