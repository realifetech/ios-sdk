//
//  TicketAdditionalField.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/27.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct TicketAdditionalField: Codable, Equatable {
    public let name: String?
    public let value: String?

    public init(name: String?, value: String?) {
        self.name = name
        self.value = value
    }
}

extension TicketAdditionalField {

    init(response: ApolloType.FragmentTicket.AdditionalField?) {
        self.name = response?.name
        self.value = response?.value
    }
}
