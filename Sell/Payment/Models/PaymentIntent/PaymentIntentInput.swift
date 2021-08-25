//
//  PaymentIntentInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct PaymentIntentInput {

    public let orderType: OrderType
    public let orderId: String
    public let paymentSource: PaymentSourceInput?
    public let amount: Int
    public let currency: String
    public let savePaymentSource: Bool
    public let livemode: Bool
    public let cancellationReason: CancellationReason?
    public let receiptEmail: String?

    public init(
        orderType: OrderType,
        orderId: String,
        paymentSource: PaymentSourceInput?,
        amount: Int,
        currency: String,
        savePaymentSource: Bool,
        livemode: Bool,
        cancellationReason: CancellationReason?,
        receiptEmail: String?
    ) {
        self.orderType = orderType
        self.orderId = orderId
        self.paymentSource = paymentSource
        self.amount = amount
        self.currency = currency
        self.savePaymentSource = savePaymentSource
        self.livemode = livemode
        self.cancellationReason = cancellationReason
        self.receiptEmail = receiptEmail
    }
}

extension PaymentIntentInput {

    var apolloInput: ApolloType.PaymentIntentInput {
        ApolloType.PaymentIntentInput(
            orderType: orderType.apolloType,
            orderId: orderId,
            paymentSource: paymentSource?.apolloInput,
            amount: amount,
            currency: currency,
            savePaymentSource: savePaymentSource,
            livemode: livemode,
            cancellationReason: cancellationReason?.apolloType,
            receiptEmail: receiptEmail)
    }
}
