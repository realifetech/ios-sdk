//
//  PaymentSourceInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct PaymentSourceInput {

    public let id: String?
    public let billingDetails: PaymentSourceBillingDetails?
    public let card: CardInput?

    public init(
        id: String?,
        billingDetails: PaymentSourceBillingDetails?,
        card: CardInput?
    ) {
        self.id = id
        self.billingDetails = billingDetails
        self.card = card
    }
}

extension PaymentSourceInput {

    var apolloInput: ApolloType.PaymentSourceInput {
        ApolloType.PaymentSourceInput(
            id: id,
            billingDetails: billingDetails?.apolloInput,
            card: card?.apolloCardInput)
    }
}
