//
//  Card.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct Card {

    public let brand: String
    public let numberToken: String
    public let expMonth: String
    public let expYear: String
    public let last4: String
    public let fingerprint: String?

    init?(response: ApolloType.FragmentCard?) {
        guard let response = response else { return nil }
        brand = response.brand
        numberToken = response.numberToken
        expMonth = response.expMonth
        expYear = response.expYear
        last4 = response.last4
        fingerprint = response.fingerprint
    }
}
