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
    public let seatInfo: [SeatInfo]?
    public let timeslot: Timeslot?
    public let collectionDate: String?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let items: [BasketItem]?

    init(response: ApolloType.FragmentBasket) {
        grossAmount = response.grossAmount
        discountAmount = response.discountAmount
        netAmount = response.netAmount
        seatInfo = response.seatInfo?.compactMap {
            SeatInfo(key: $0?.key, value: $0?.value)
        }
        timeslot = Timeslot(response: response.timeslot?.fragments.fragmentTimeslot)
        collectionDate = response.collectionDate
        collectionPreferenceType = CollectionPreferenceType(rawValue: response.collectionPreferenceType ?? "")
        items = response.items?.compactMap {
            BasketItem(response: $0)
        }
    }
}
