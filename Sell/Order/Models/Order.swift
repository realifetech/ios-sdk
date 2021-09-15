//
//  Order.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct Order: Codable, Equatable {

    public let id: String
    public let orderNumber: String
    public let qrCodeUrl: String?
    public let collectionDate: Date?
    public let status: OrderStatus?
    public let state: OrderState?
    public let paymentStatus: String?
    public let grossAmount: Int?
    public let discountAmount: Int?
    public let netAmount: Int?
    public let createdAt: Date?
    public let estimatedAt: Date?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let seatInfo: SeatInfo?
    public let items: [OrderItem]?
    public let timeslot: Timeslot?
    public let fulfilmentPoint: FulfilmentPoint?

    public init(
        id: String,
        orderNumber: String,
        qrCodeUrl: String?,
        collectionDate: Date?,
        status: OrderStatus?,
        state: OrderState?,
        paymentStatus: String?,
        grossAmount: Int?,
        discountAmount: Int?,
        netAmount: Int?,
        createdAt: Date?,
        estimatedAt: Date?,
        collectionPreferenceType: CollectionPreferenceType?,
        seatInfo: SeatInfo?,
        items: [OrderItem]?,
        timeslot: Timeslot?,
        fulfilmentPoint: FulfilmentPoint?
    ) {
        self.id = id
        self.orderNumber = orderNumber
        self.qrCodeUrl = qrCodeUrl
        self.collectionDate = collectionDate
        self.status = status
        self.state = state
        self.paymentStatus = paymentStatus
        self.grossAmount = grossAmount
        self.discountAmount = discountAmount
        self.netAmount = netAmount
        self.createdAt = createdAt
        self.estimatedAt = estimatedAt
        self.collectionPreferenceType = collectionPreferenceType
        self.seatInfo = seatInfo
        self.items = items
        self.timeslot = timeslot
        self.fulfilmentPoint = fulfilmentPoint
    }
}

extension Order {

    init?(response: ApolloType.FragmentOrder?) {
        guard let response = response else { return nil }
        id = response.id
        orderNumber = response.orderNumber
        qrCodeUrl = response.qrCodeUrl
        collectionDate = response.collectionDate?.iso8601Date
        status = OrderStatus(apolloType: response.status)
        state = OrderState(response: response.state)
        paymentStatus = response.paymentStatus
        grossAmount = response.grossAmount
        discountAmount = response.discountAmount
        netAmount = response.netAmount
        createdAt = response.createdAt?.iso8601Date
        estimatedAt = response.estimatedAt?.iso8601Date
        collectionPreferenceType = CollectionPreferenceType(apolloType: response.collectionPreferenceType)
        seatInfo = SeatInfo(json: response.seatInfo)
        items = response.items?.compactMap {
            OrderItem(response: $0)
        }
        timeslot = Timeslot(response: response.timeslot?.fragments.fragmentTimeslot)
        fulfilmentPoint = FulfilmentPoint(response: response.fulfilmentPoint?.fragments.fragmentFulfilmentPoint)
    }
}
