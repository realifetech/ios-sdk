//
//  PaymentIntent.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct PaymentIntent: Codable, Equatable {

    public let id: String
    public let orderType: OrderType
    public let orderId: String
    public let status: PaymentStatus
    public let paymentSource: PaymentSource?
    public let amount: Int
    public let currency: String
    public let livemode: Bool
    public let cancellationReason: CancellationReason?
    public let savePaymentSource: Bool?
    public let nextAction: PaymentIntentNextAction?
    public let lastPaymentError: String?

    public init(
        id: String,
        orderType: OrderType,
        orderId: String,
        status: PaymentStatus,
        paymentSource: PaymentSource?,
        amount: Int,
        currency: String,
        livemode: Bool,
        cancellationReason: CancellationReason?,
        savePaymentSource: Bool?,
        nextAction: PaymentIntentNextAction?,
        lastPaymentError: String?
    ) {
        self.id = id
        self.orderType = orderType
        self.orderId = orderId
        self.status = status
        self.paymentSource = paymentSource
        self.amount = amount
        self.currency = currency
        self.livemode = livemode
        self.cancellationReason = cancellationReason
        self.savePaymentSource = savePaymentSource
        self.nextAction = nextAction
        self.lastPaymentError = lastPaymentError
    }
}

extension PaymentIntent {

    init?(response: ApolloType.FragmentPaymentIntent?) {
        guard let response = response else { return nil }
        id = response.id
        orderType = OrderType(apolloType: response.orderType)
        orderId = response.orderId
        status = PaymentStatus(apolloType: response.status)
        paymentSource = PaymentSource(response: response.paymentSource?.fragments.fragmentPaymentSource)
        amount = response.amount
        currency = response.currency
        livemode = response.livemode
        cancellationReason = CancellationReason(apolloType: response.cancellationReason)
        savePaymentSource = response.savePaymentSource
        nextAction = PaymentIntentNextAction(response: response.nextAction)
        lastPaymentError = response.lastPaymentError
    }
}
