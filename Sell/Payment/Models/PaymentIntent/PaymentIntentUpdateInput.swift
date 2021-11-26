//
//  PaymentIntentUpdateInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

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
        var updatePaymentStatus: ApolloType.UpdatePaymentStatus?
        if let status = status?.rawValue {
            updatePaymentStatus = ApolloType.UpdatePaymentStatus(rawValue: status)
        }
        return ApolloType.PaymentIntentUpdateInput(
            status: updatePaymentStatus,
            paymentSource: paymentSource?.apolloInput,
            savePaymentSource: savePaymentSource)
    }
}

public enum UpdatePaymentStatus: String {
    case canceled
}
