//
//  PaymentsAccessible.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol PaymentsAccessible {
    func addPaymentSource(
        _ input: ApolloType.PaymentSourceInput,
        completion: @escaping (Result<ApolloType.PaymentSourceDetails, Error>) -> Void)

    func getPaymentSources(
        pageSize: Int,
        page: Int?,
        completion: @escaping (Result<[ApolloType.PaymentSourceDetails], Error>) -> Void)

    func createPaymentIntent(
        _ input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<PaymentIntent, Error>) -> Void)

    func updatePaymentIntent(
        id: String,
        input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<PaymentIntent, Error>) -> Void)
}

// TODO: Should this type already exist in ApolloTypes?
public struct PaymentIntent {
    var id: Int
    var orderType: ApolloType.OrderType
    var orderId: Int
    var status: ApolloType.PaymentStatus
    var paymentSource: ApolloType.PaymentSourceDetails
    var amount: Int
    var currency: String
    var liveMode: Bool
    var cancellationReason: ApolloType.CancellationReason
    var savePaymentSource: Bool
    var receiptEmail: String
    var nextAction: ApolloType.PaymentActionType
    var lastPaymentError: String
}
