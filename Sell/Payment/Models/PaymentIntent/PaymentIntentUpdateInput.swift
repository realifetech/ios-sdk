//
//  PaymentIntentUpdateInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaymentIntentUpdateInput {

    public let status: UpdatePaymentStatus?
    public let paymentSource: PaymentSourceInput?
    public let savePaymentSource: Bool?

    public init(
        status: UpdatePaymentStatus?,
        paymentSource: PaymentSourceInput?,
        savePaymentSource: Bool?
    ) {
        self.status = status
        self.paymentSource = paymentSource
        self.savePaymentSource = savePaymentSource
    }
}

extension PaymentIntentUpdateInput {

    var apolloInput: ApolloType.PaymentIntentUpdateInput {
        ApolloType.PaymentIntentUpdateInput(
            status: ApolloType.UpdatePaymentStatus(rawValue: status?.rawValue ?? ""),
            paymentSource: paymentSource?.apolloInput,
            savePaymentSource: savePaymentSource)
    }
}

public enum UpdatePaymentStatus: String {
    case canceled
}
