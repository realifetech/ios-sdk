//
//  Identity.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol Identity {
    func getSSO(provider: String, completion: @escaping (Result<SSO?, Error>) -> Void)
    func deleteMyAccount(completion: @escaping (Result<Bool, Error>) -> Void)
    func identify(userId: String, traits: [RLTTraitType: Any], completion: ((Result<Bool, Error>) -> Void)?)
    func alias(aliasType: RLTAliasType, aliasId: String, completion: ((Result<Bool, Error>) -> Void)?)
    func clear()
}

private protocol StringRepresentable {
    var stringValue: String { get }
}

public enum RLTTraitType: Hashable, StringRepresentable {
    case email, firstName, lastName, dateOfBirth, pushConsent, emailConsent
    case dynamic(rawValue: String)

    var stringValue: String {
        switch self {
        case .email: return "email"
        case .firstName: return "firstName"
        case .lastName: return "lastName"
        case .dateOfBirth: return "dateOfBirth"
        case .pushConsent: return "pushConsent"
        case .emailConsent: return "emailConsent"
        case .dynamic(let rawValue): return rawValue
        }
    }
}

public enum RLTAliasType: StringRepresentable {
    case externalUserId, altExternalUserId, ticketmasterAccountId, tdcAccountId, bleepAccountId
    case dynamic(rawValue: String)

    var stringValue: String {
        switch self {
        case .externalUserId: return "EXTERNAL_USER_ID"
        case .altExternalUserId: return "ALT_EXTERNAL_USER_ID"
        case .ticketmasterAccountId: return "TM_ACCOUNT_ID"
        case .tdcAccountId: return "TDC_ACCOUNT_ID"
        case .bleepAccountId: return "BLEEP_ACCOUNT_ID"
        case .dynamic(let rawValue): return rawValue
        }
    }
}
