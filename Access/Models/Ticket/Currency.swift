//
//  Currency.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/27.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct Currency: Codable, Equatable {
    public let id: Int?
    public let title: String?
    public let isoCode: String?
    public let sign: String?

    public init(
        id: Int?,
        title: String?,
        isoCode: String?,
        sign: String?
    ) {
        self.id = id
        self.title = title
        self.isoCode = isoCode
        self.sign = sign
    }
}

extension Currency {

    init(response: ApolloType.FragmentTicket.Currency?) {
        self.id = response?.id
        self.title = response?.title
        self.isoCode = response?.isoCode
        self.sign = response?.sign
    }
}
