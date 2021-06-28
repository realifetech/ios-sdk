//
//  Order.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct Order {

    public let id: String
    public let orderNumber: String?
    public let qrCodeUrl: String?
    public let collectionDate: Date?
    public let status: OrderStatus?
    public let state: OrderState?
    public let paymentStatus: String?
    public let grossAmount: Int?
    public let discountAmount: Int?
    public let netAmount: Int?
    public let estimatedAt: Date?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let seatInfo: SeatInfo?
    public let items: [OrderItem]?
    public let timeslot: Timeslot?
    public let fulfilmentPoint: FulfilmentPoint?

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
        estimatedAt = response.estimatedAt?.iso8601Date
        collectionPreferenceType = CollectionPreferenceType(apolloType: response.collectionPreferenceType)
        seatInfo = SeatInfo(response: response.seatInfo?.fragments.fragmentSeatInfo)
        items = response.items?.compactMap {
            OrderItem(response: $0)
        }
        timeslot = Timeslot(response: response.timeslot?.fragments.fragmentTimeslot)
        fulfilmentPoint = FulfilmentPoint(response: response.fulfilmentPoint?.fragments.fragmentFulfilmentPoint)
    }
}
