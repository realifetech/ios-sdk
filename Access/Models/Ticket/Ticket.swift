//
//  Ticket.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/26.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct Ticket: Codable, Equatable {
    public let id: String
    public let seat: String?
    public let qrCodeUrl: String?
    public let sessionDate: String?
    public let title: String?
    public let eventUId: String?
    public let barCode: String?
    public let sectorName: String?
    public let venueName: String?
    public let venueRoom: String?
    public let clientName: String?
    public let section: String?
    public let row: String?
    public let clientEmail: String?
    public let price: Double?
    public let currency: Currency?
    public let externalCustomerRef: String?
    public let externalCardRef: String?
    public let entrance: String?
    public let shareLink: String?
    public let canShare: Bool?
    public let legalLongText: String?
    public let legalShortText: String?
    public let mapImageUrl: String?
    public let mapUrl: String?
    public let status: String?
    public let redeemedAt: String?
    public let redeemerEmail: String?
    public let sharerEmail: String?
    public let additionalFields: [TicketAdditionalField]?
    public let printed: Bool?

    public init(
        id: String,
        seat: String?,
        qrCodeUrl: String?,
        sessionDate: String?,
        title: String?,
        eventUId: String?,
        barCode: String?,
        sectorName: String?,
        venueName: String?,
        venueRoom: String?,
        clientName: String?,
        section: String?,
        row: String?,
        clientEmail: String?,
        price: Double?,
        currency: Currency?,
        externalCustomerRef: String?,
        externalCardRef: String?,
        entrance: String?,
        shareLink: String?,
        canShare: Bool?,
        legalLongText: String?,
        legalShortText: String?,
        mapImageUrl: String?,
        mapUrl: String?,
        status: String?,
        redeemedAt: String?,
        redeemerEmail: String?,
        sharerEmail: String?,
        additionalFields: [TicketAdditionalField]?,
        printed: Bool?
    ) {
        self.id = id
        self.seat = seat
        self.qrCodeUrl = qrCodeUrl
        self.sessionDate = sessionDate
        self.title = title
        self.eventUId = eventUId
        self.barCode = barCode
        self.sectorName = sectorName
        self.venueName = venueName
        self.venueRoom = venueRoom
        self.clientName = clientName
        self.section = section
        self.row = row
        self.clientEmail = clientEmail
        self.price = price
        self.currency = currency
        self.externalCustomerRef = externalCustomerRef
        self.externalCardRef = externalCardRef
        self.entrance = entrance
        self.shareLink = shareLink
        self.canShare = canShare
        self.legalLongText = legalLongText
        self.legalShortText = legalShortText
        self.mapImageUrl = mapImageUrl
        self.mapUrl = mapUrl
        self.status = status
        self.redeemedAt = redeemedAt
        self.redeemerEmail = redeemerEmail
        self.sharerEmail = sharerEmail
        self.additionalFields = additionalFields
        self.printed = printed
    }
}

extension Ticket {

    public var statusState: TicketStatusState? {
        return TicketStatusState(rawValue: status ?? "")
    }
}

public enum TicketStatusState: String {
    case active, disabled, shared, redeemed
}

extension Ticket {

    init?(response: ApolloType.FragmentTicket?) {
        guard let response = response, let ticketId = response.id else { return nil }
        id = ticketId
        seat = response.seat
        qrCodeUrl = response.qrCodeUrl
        sessionDate = response.sessionDate
        title = response.title
        eventUId = response.eventUId
        barCode = response.barCode
        sectorName = response.sectorName
        venueName = response.venueName
        venueRoom = response.venueRoom
        clientName = response.clientName
        section = response.section
        row = response.row
        clientEmail = response.clientEmail
        price = response.price
        currency = Currency(response: response.currency)
        externalCustomerRef = response.externalCustomerRef
        externalCardRef = response.externalCardRef
        entrance = response.entrance
        shareLink = response.shareLink
        canShare = response.canShare
        legalLongText = response.legalLongText
        legalShortText = response.legalShortText
        mapImageUrl = response.mapImageUrl
        mapUrl = response.mapUrl
        status = response.status
        redeemedAt = response.redeemedAt
        redeemerEmail = response.redeemerEmail
        sharerEmail = response.sharerEmail
        additionalFields = (response.additionalFields?.compactMap {
            TicketAdditionalField(response: $0)
        })
        printed = response.printed
    }
}
