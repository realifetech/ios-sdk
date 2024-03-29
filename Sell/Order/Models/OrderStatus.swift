//
//  OrderStatus.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum OrderStatus: String, Codable {

    case confirmed = "CONFIRMED"
    case onHold = "ON_HOLD"
    case inProgress = "IN_PROGRESS"
    case prepComplete = "PREP_COMPLETE"
    case readyToCollect = "READY_TO_COLLECT"
    case cancelled = "CANCELLED"
    case complete = "COMPLETE"
    case onTheWay = "ON_THE_WAY"
    case paymentPending = "PAYMENT_PENDING"
    case paymentInProgress = "PAY_IN_PROGRESS"
    case refunded = "REFUNDED"
    case refundRequested = "REFUND_REQUESTED"
    case paymentError = "PAYMENT_ERROR"
}
