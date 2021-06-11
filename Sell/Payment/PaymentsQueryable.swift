//
//  PaymentsQueryable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol PaymentsQueryable {
    func addPaymentSource(
        input: PaymentSourceInput,
        completion: @escaping (Result<PaymentSource, Error>) -> Void)

    func getPaymentSources(
        pageSize: Int,
        page: Int?,
        completion: @escaping (Result<PaginatedObject<PaymentSource>, Error>) -> Void)

    func createPaymentIntent(
        input: PaymentIntentInput,
        completion: @escaping (Result<PaymentIntent, Error>) -> Void)

    func updatePaymentIntent(
        id: String,
        input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<PaymentIntent, Error>) -> Void)
}

// These protocols should be replaced some kind of model object, this could just wrap around the GraphQL object
public protocol PaymentSourceInput {}
public protocol PaymentSource {}
public protocol PaymentIntentInput {}
public protocol PaymentIntent {}
