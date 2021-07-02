//
//  PaymentStatus.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum PaymentStatus: String {

    case requiresPaymentMethod
    case requiresAction
    case processing
    case succeeded
    case canceled
    case unknown

    init(apolloType: ApolloType.PaymentStatus) {
        switch apolloType {
        case .requiresPaymentMethod:
            self = .requiresPaymentMethod
        case .requiresAction:
            self = .requiresAction
        case .processing:
            self = .processing
        case .succeeded:
            self = .succeeded
        case .canceled:
            self = .canceled
        case .__unknown:
            self = .unknown
        }
    }
}
