//
//  CancellationReason.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum CancellationReason: String, Codable {

    case duplicate
    case fraudulent
    case requestedByCustomer
    case abandoned

    init?(apolloType: ApolloType.CancellationReason?) {
        switch apolloType {
        case .duplicate:
            self = .duplicate
        case .fraudulent:
            self = .fraudulent
        case .requestedByCustomer:
            self = .requestedByCustomer
        case .abandoned:
            self = .abandoned
        default:
            return nil
        }
    }
}

extension CancellationReason {

    var apolloType: ApolloType.CancellationReason {
        switch self {
        case .duplicate:
            return .duplicate
        case .fraudulent:
            return .fraudulent
        case .requestedByCustomer:
            return .requestedByCustomer
        case .abandoned:
            return .abandoned
        }
    }
}
