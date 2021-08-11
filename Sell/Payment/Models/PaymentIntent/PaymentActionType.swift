//
//  PaymentActionType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public enum PaymentActionType: String, Codable {

    case redirectToUrl
    case collectCvc

    init?(apolloType: ApolloType.PaymentActionType) {
        switch apolloType {
        case .redirectToUrl:
            self = .redirectToUrl
        case .collectCvc:
            self = .collectCvc
        case .__unknown:
            return nil
        }
    }
}
