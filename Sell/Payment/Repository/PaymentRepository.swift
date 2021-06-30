//
//  PaymentRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public final class PaymentRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension PaymentRepository: PaymentProvidable {

    public func addPaymentSource(
        input: PaymentSourceInput,
        callback: @escaping (Result<PaymentSource, Error>) -> Void) { }

    public func getMyPaymentSources(
        pageSize: Int,
        page: Int,
        callback: @escaping (Result<PaginatedObject<PaymentSource>, Error>) -> Void) { }

    public func createPaymentIntent(
        input: PaymentIntentInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void) { }

    public func updatePaymentIntent(
        id: String,
        input: PaymentIntentInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void) { }
}
