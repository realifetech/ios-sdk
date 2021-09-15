//
//  PaymentSourceBillingDetails.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct PaymentSourceBillingDetails: Codable, Equatable {

    public struct Address: Codable, Equatable {

        public let city: String?
        public let country: String?
        public let line1: String?
        public let line2: String?
        public let postalCode: String?
        public let state: String?

        public init(
            city: String?,
            country: String?,
            line1: String?,
            line2: String?,
            postalCode: String?,
            state: String?
        ) {
            self.city = city
            self.country = country
            self.line1 = line1
            self.line2 = line2
            self.postalCode = postalCode
            self.state = state
        }
    }

    public let address: Address?
    public let email: String?
    public let name: String?
    public let phone: String?

    public init(
        address: Address?,
        email: String?,
        name: String?,
        phone: String?
    ) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = phone
    }
}

extension PaymentSourceBillingDetails {

    init?(response: ApolloType.FragmentPaymentSource.BillingDetail?) {
        guard let response = response else { return nil }
        address = Address(
            city: response.address?.city,
            country: response.address?.country,
            line1: response.address?.line1,
            line2: response.address?.line2,
            postalCode: response.address?.postalCode,
            state: response.address?.state)
        email = response.email
        name = response.name
        phone = response.phone
    }
}

extension PaymentSourceBillingDetails {

    var apolloInput: ApolloType.PaymentSourceBillingDetailsInput {
        ApolloType.PaymentSourceBillingDetailsInput(
            address: ApolloType.PaymentSourceAddressInput(
                city: address?.city,
                country: address?.country,
                line1: address?.line1,
                line2: address?.line2,
                postalCode: address?.postalCode,
                state: address?.state),
            email: email,
            name: name,
            phone: phone)
    }
}
