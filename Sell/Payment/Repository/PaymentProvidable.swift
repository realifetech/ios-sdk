//
//  PaymentProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol PaymentProvidable {

    func addPaymentSource(
        input: PaymentSourceInput,
        callback: @escaping (Result<PaymentSource, Error>) -> Void)

    func deletePaymentSource(
        id: String,
        callback: @escaping (Result<PaymentSource, Error>) -> Void)

    func getMyPaymentSources(
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<PaymentSource>, Error>) -> Void)

    func createMyPaymentIntent(
        input: PaymentIntentInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void)

    func updateMyPaymentIntent(
        id: String,
        input: PaymentIntentUpdateInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void)

    func getMyPaymentIntent(
        id: String,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void)
}
