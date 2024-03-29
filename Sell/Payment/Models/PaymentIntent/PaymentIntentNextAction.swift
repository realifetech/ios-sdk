//
//  PaymentIntentNextAction.swift
//  RealifeTech
//
//  Created by Mickey Lee on 12/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

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
            let actionType = response.type,
            let paymentActionType = PaymentActionType(apolloType: actionType)
        else { return nil }
        type = paymentActionType
        url = response.url
    }
}
