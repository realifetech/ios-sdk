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
    public let fulfilmentPointId: String?
    public let seatInfo: [SeatInfo]?
    public let items: [BasketItemInput]?
}
