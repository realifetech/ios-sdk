//
//  IdentityImplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public class IdentityImplementing: Identity {

    private let analyticsLogger: Analytics
    private let identityPersister: IdentityPersisting
    private let graphQLManager: GraphQLManageable

    init(analyticsLogger: Analytics,
         identityPersister: IdentityPersisting,
         graphQLManager: GraphQLManageable) {
        self.analyticsLogger = analyticsLogger
        self.identityPersister = identityPersister
        self.graphQLManager = graphQLManager
    }

    public func getSSO(provider: String, completion: @escaping (Result<SSO?, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetSsoQuery(provider: provider),
            cachePolicy: .returnCacheDataElseFetch
        ) { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    return completion(.failure(GraphQLManagerError.noDataError))
                }
                let sso = SSO(response: data)
                completion(.success(sso))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    public func deleteMyAccount(completion: @escaping (Result<Bool, Error>) -> Void) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.DeleteMyAccountMutation(),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard let isSuccess = response.data?.deleteMyAccount?.success else {
                    return completion(.failure(GraphQLManagerError.noDataError))
                }
                completion(.success(isSuccess))
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
        track(.identify, new: stringKeyTraits, completion: completion)
    }

    /// Link the current user (as identified previously) to the id of an external system
    /// - Example:
    /// ```
    /// RealifeTech.Identity.alias(.ticketmasterAccountId, "5678")
    /// ```
    public func alias(aliasType: RLTAliasType,
                      aliasId: String,
                      completion: ((Result<Bool, Error>) -> Void)?) {
        track(.alias, new: [aliasType.stringValue: aliasId], completion: completion)
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

    private func track(_ action: AnalyticEventAction,
                       new: [String: Any],
                       completion: ((Result<Bool, Error>) -> Void)?) {
        let event = AnalyticEvent(type: "user", action: action.rawValue, new: new, version: "TODO-make-optional")
        analyticsLogger.track(event, completion: completion ?? {_ in})
    }
}
