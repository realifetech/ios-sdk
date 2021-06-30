//
//  CollectionPreferenceType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum CollectionPreferenceType: String, Codable {
    case asap = "ASAP"
    case preorder = "PREORDER"
    case checkin = "CHECKIN"

    init?(apolloType: ApolloType.CollectionPreferenceType?) {
        guard
            let apolloType = apolloType,
            !apolloType.isUnknownType
        else { return nil }
        switch apolloType {
        case .asap:
            self = .asap
        case .preorder:
            self = .preorder
        case .checkin:
            self = .checkin
        case .__unknown:
            return nil // never enter this case
        }
    }

    var apolloType: ApolloType.CollectionPreferenceType {
        switch self {
        case .asap:
            return .asap
        case .preorder:
            return .preorder
        case .checkin:
            return .checkin
        }
    }
}

private extension ApolloType.CollectionPreferenceType {

    var isUnknownType: Bool {
        guard case .__unknown = self else { return false }
        return true
    }
}
