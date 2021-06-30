//
//  Basket.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct Basket {

    public let grossAmount: Int?
    public let discountAmount: Int?
    public let netAmount: Int?
    public let seatInfo: SeatInfo?
    public let timeslot: Timeslot?
    public let collectionDate: Date?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let items: [BasketItem]?

    init(response: ApolloType.FragmentBasket) {
        grossAmount = response.grossAmount
        discountAmount = response.discountAmount
        netAmount = response.netAmount
        seatInfo = SeatInfo(response: response.seatInfo?.fragments.fragmentSeatInfo)
        timeslot = Timeslot(response: response.timeslot?.fragments.fragmentTimeslot)
        collectionDate = response.collectionDate?.iso8601Date
        collectionPreferenceType = CollectionPreferenceType(apolloType: response.collectionPreferenceType)
        items = response.items?.compactMap {
            BasketItem(response: $0)
        }
    }
}
