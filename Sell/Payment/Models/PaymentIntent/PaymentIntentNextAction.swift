//
//  PaymentIntentNextAction.swift
//  RealifeTech
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct PaymentIntentNextAction: Codable, Equatable {

    public let type: PaymentActionType
    public let url: String?

    public init(type: PaymentActionType, url: String?) {
        self.type = type
        self.url = url
    }
}

extension PaymentIntentNextAction {

    init?(response: ApolloType.FragmentPaymentIntent.NextAction?) {
        guard
            let response = response,
            let paymentActionType = PaymentActionType(apolloType: response.type)
        else { return nil }
        type = paymentActionType
        url = response.url
    }
}
