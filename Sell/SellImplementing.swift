//
//  SellImplementing.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class SellImplementing: Sell {

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    // MARK: - ProductsGettable

    public func getProductById(
        _ id: String,
        completion: @escaping (Result<ApolloType.FragmentProduct, Error>) -> Void
    ) {

    }

    public func getProducts(
        pageSize: Int,
        page: Int?,
        filters: ApolloType.ProductFilter?,
        completion: @escaping (Result<ApolloType.FragmentProducts, Error>) -> Void
    ) {
        
    }

    // MARK: - OrdersGettable

    public func getOrders(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentOrder], Error>) -> Void
    ) {
        print("Get orders called")
        completion(.failure(SellError.none))
    }

    // MARK: - PaymentsAccessible

    public func addPaymentSource(
        _ input: ApolloType.PaymentSourceInput,
        completion: @escaping (Result<ApolloType.PaymentSourceDetails, Error>) -> Void
    ) {
        print("Add payment source called")
        completion(.failure(SellError.none))
    }

    public func getPaymentSources(
        pageSize: Int,
        page: Int?,
        completion: @escaping (Result<[ApolloType.PaymentSourceDetails], Error>) -> Void
    ) {
        print("Get payment sources called")
        completion(.failure(SellError.none))
    }

    public func createPaymentIntent(
        _ input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void
    ) {
        print("Create payment intent called")
        completion(.failure(SellError.none))
    }

    public func updatePaymentIntent(
        id: String,
        input: ApolloType.PaymentIntentInput,
        completion: @escaping (Result<ApolloType.FragmentPaymentIntent, Error>) -> Void
    ) {
        print("Update payment intent called")
        completion(.failure(SellError.none))
    }
}
