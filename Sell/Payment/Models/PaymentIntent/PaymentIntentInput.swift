//
//  PaymentIntentInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

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
