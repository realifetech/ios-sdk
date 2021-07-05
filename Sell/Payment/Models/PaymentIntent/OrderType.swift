//
//  OrderType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum OrderType: String, Codable {

    case foodAndBeverage
    case ticket
    case unknown

    init(apolloType: ApolloType.OrderType) {
        switch apolloType {
        case .foodAndBeverage:
            self = .foodAndBeverage
        case .ticket:
            self = .ticket
        case .__unknown:
            self = .unknown
        }
    }
}

extension OrderType {

    var apolloType: ApolloType.OrderType {
        switch self {
        case .foodAndBeverage:
            return .foodAndBeverage
        case .ticket:
            return .ticket
        case .unknown:
            return .__unknown("")
        }
    }
}
