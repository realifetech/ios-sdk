//
//  Card.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct Card: Codable, Equatable {

    public let brand: String
    public let numberToken: String?
    public let expMonth: String?
    public let expYear: String?
    public let last4: String
    public let fingerprint: String?

    public init(
        brand: String,
        numberToken: String,
        expMonth: String,
        expYear: String,
        last4: String,
        fingerprint: String?
    ) {
        self.brand = brand
        self.numberToken = numberToken
        self.expMonth = expMonth
        self.expYear = expYear
        self.last4 = last4
        self.fingerprint = fingerprint
    }
}

extension Card {

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
