//
//  CardInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct CardInput {

    public let brand: String
    public let numberToken: String
    public let expMonth: String
    public let expYear: String
    public let securityCodeToken: String
    public let last4: String
}

extension CardInput {

    var apolloCardInput: ApolloType.CardInput {
        ApolloType.CardInput(
            brand: brand,
            numberToken: numberToken,
            expMonth: expMonth,
            expYear: expYear,
            securityCodeToken: securityCodeToken,
            last4: last4)
    }
}
