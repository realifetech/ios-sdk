//
//  TicketIntegration.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/30.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

// swiftlint:disable identifier_name
public enum TicketingIntegrationName: String {
    case AXS
    case TICKETMASTER
    case Blueticket
    case unknown
}

public struct TicketIntegration {
    public let id: Int?
    public let integrationName: String?

    public init(
        id: Int?,
        integrationName: String?
    ) {
        self.id = id
        self.integrationName = integrationName
    }
}

extension TicketIntegration {
    var type: TicketingIntegrationName {
        guard let integrationName = integrationName,
              let integrationType = TicketingIntegrationName(rawValue: integrationName)
        else { return .unknown }
        return integrationType
    }
}

extension TicketIntegration {

    init(response: ApolloType.FragmentTicketAuth.TicketIntegration?) {
        self.id = response?.id
        self.integrationName = response?.name
    }
}
