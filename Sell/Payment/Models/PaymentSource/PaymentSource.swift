//
//  PaymentSource.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaymentSource: Codable, Equatable {

    public let id: String
    public let type: PaymentSourceType
    public let isDefault: Bool
    public let billingDetails: PaymentSourceBillingDetails?
    public let card: Card?

    public init(
        id: String,
        type: PaymentSourceType,
        isDefault: Bool,
        billingDetails: PaymentSourceBillingDetails?,
        card: Card?
    ) {
        self.id = id
        self.type = type
        self.isDefault = isDefault
        self.billingDetails = billingDetails
        self.card = card
    }
}

extension PaymentSource {

    init?(response: ApolloType.FragmentPaymentSource?) {
        guard let response = response else { return nil }
        id = response.id
        type = PaymentSourceType(rawValue: response.type.rawValue) ?? .card
        isDefault = response.default
        billingDetails = PaymentSourceBillingDetails(response: response.billingDetails)
        card = Card(response: response.card?.fragments.fragmentCard)
    }
}
