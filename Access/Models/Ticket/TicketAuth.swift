//
//  TicketAuth.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/27.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct TicketAuth: Codable {
    public let id: Int?
    public let userEmail: UserEmail?
    public let ticketIntegration: TicketIntegration?
    public let accessToken: String?
    public let refreshToken: String?
    public let expireAt: String?
    public let clientEmail: String?
    public let clientId: String?

    public init(
        id: Int?,
        userEmail: UserEmail?,
        ticketIntegration: TicketIntegration?,
        accessToken: String?,
        refreshToken: String?,
        expireAt: String?,
        clientEmail: String?,
        clientId: String?
    ) {
        self.id = id
        self.userEmail = userEmail
        self.ticketIntegration = ticketIntegration
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expireAt = expireAt
        self.clientEmail = clientEmail
        self.clientId = clientId
    }
}

extension TicketAuth {

    init(response: ApolloType.FragmentTicketAuth?) {
        self.id = response?.id
        self.userEmail = UserEmail(response: response?.userEmail)
        self.ticketIntegration = TicketIntegration(response: response?.ticketIntegration)
        self.accessToken = response?.accessToken
        self.refreshToken = response?.refreshToken
        self.expireAt = response?.expireAt
        self.clientEmail = response?.clientEmail
        self.clientId = response?.clientId
    }
}
