//
//  FulfilmentPointType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum FulfilmentPointType: String, Codable {

    case homeDelivery = "HOME_DELIVERY"
    case collection = "COLLECTION"
    case seatDelivery = "SEAT_DELIVERY"
    case digitalRedemption = "DIGITAL_REDEMPTION"
    case virtualQueue = "VIRTUAL_QUEUE"
    case collectWhenReady = "COLLECT_WHEN_READY"
}
