//
//  PaymentSourceInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaymentSourceInput {

    public let id: String?
    public let billingDetails: PaymentSourceBillingDetails?
    public let card: CardInput?
}

extension PaymentSourceInput {

    var apolloInput: ApolloType.PaymentSourceInput {
        ApolloType.PaymentSourceInput(
            id: id,
            billingDetails: billingDetails?.apolloInput,
            card: card?.apolloCardInput)
    }
}
