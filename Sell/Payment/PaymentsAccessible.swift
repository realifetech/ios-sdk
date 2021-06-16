//
//  PaymentsAccessible.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol PaymentsAccessible: SellCachingManageable {
    func addPaymentSource(
        _ input: ApolloType.PaymentSourceInput,
        completion: @escaping (Result<ApolloType.PaymentSourceDetails, Error>) -> Void)

    func getPaymentSources(
        pageSize: Int,
        page: Int?,
        completion: @escaping (Result<[ApolloType.PaymentSourceDetails], Error>) -> Void)

    func createPaymentIntent(
        _ input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void)

    func updatePaymentIntent(
        id: String,
        input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void)
}

public struct PaymentRetriever: PaymentsAccessible {

    public let isUserBaedObject: Bool = true

    public func addPaymentSource(
        _ input: ApolloType.PaymentSourceInput,
        completion: @escaping (Result<ApolloType.PaymentSourceDetails, Error>) -> Void) { }

    public func getPaymentSources(
        pageSize: Int,
        page: Int?,
        completion: @escaping (Result<[ApolloType.PaymentSourceDetails], Error>) -> Void) { }

    public func createPaymentIntent(
        _ input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void) { }

    public func updatePaymentIntent(
        id: String,
        input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void) { }
}
