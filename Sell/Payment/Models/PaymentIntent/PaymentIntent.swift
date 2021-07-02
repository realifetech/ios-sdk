//
//  PaymentIntent.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaymentIntent {

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

public struct PaymentIntentNextAction {

    public let type: PaymentActionType
    public let url: String?

    init?(response: ApolloType.FragmentPaymentIntent.NextAction?) {
        guard
            let response = response,
            let paymentActionType = PaymentActionType(apolloType: response.type)
        else { return nil }
        type = paymentActionType
        url = response.url
    }
}
