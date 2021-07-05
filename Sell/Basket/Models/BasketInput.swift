//
//  BasketInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct BasketInput {

    public let collectionDate: Date?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let timeslotId: String?
    public let fulfilmentPointId: String
    public let seatInfo: SeatInfo?
    public let items: [BasketItemInput]

    public init(
        collectionDate: Date?,
        collectionPreferenceType: CollectionPreferenceType?,
        timeslotId: String?,
        fulfilmentPointId: String,
        seatInfo: SeatInfo?,
        items: [BasketItemInput]
    ) {
        self.collectionDate = collectionDate
        self.collectionPreferenceType = collectionPreferenceType
        self.timeslotId = timeslotId
        self.fulfilmentPointId = fulfilmentPointId
        self.seatInfo = seatInfo
        self.items = items
    }
}
