//
//  PaymentRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 30/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public final class PaymentRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension PaymentRepository: PaymentProvidable {

    public func addPaymentSource(
        input: PaymentSourceInput,
        callback: @escaping (Result<PaymentSource, Error>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.AddPaymentSourceToMyWalletMutation(input: input.apolloInput),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let fragment = response.data?.addPaymentSourceToMyWallet?.fragments.fragmentPaymentSource,
                    let paymentSource = PaymentSource(response: fragment)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(paymentSource))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func deletePaymentSource(
        id: String,
        callback: @escaping (Result<PaymentSource, Error>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.DeleteMyPaymentSourceMutation(id: id),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let fragment = response.data?.deleteMyPaymentSource?.fragments.fragmentPaymentSource,
                    let paymentSource = PaymentSource(response: fragment)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(paymentSource))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getMyPaymentSources(
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<PaymentSource>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyPaymentSourcesQuery(pageSize: pageSize, page: page),
            cachePolicy: .fetchIgnoringCacheCompletely
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getMyPaymentSources?.edges?.compactMap {
                    PaymentSource(response: $0?.fragments.fragmentPaymentSource)
                }
                let paginatedObject = PaginatedObject<PaymentSource>(
                    items: items ?? [],
                    nextPage: response.data?.getMyPaymentSources?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func createMyPaymentIntent(
        input: PaymentIntentInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.CreateMyPaymentIntentMutation(input: input.apolloInput),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedPaymentIntent = response.data?.createMyPaymentIntent?.fragments.fragmentPaymentIntent,
                    let paymentIntent = PaymentIntent(response: returnedPaymentIntent)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(paymentIntent))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func updateMyPaymentIntent(
        id: String,
        input: PaymentIntentUpdateInput,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.UpdateMyPaymentIntentMutation(id: id, input: input.apolloInput),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedPaymentIntent = response.data?.updateMyPaymentIntent?.fragments.fragmentPaymentIntent,
                    let paymentIntent = PaymentIntent(response: returnedPaymentIntent)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(paymentIntent))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getMyPaymentIntent(
        id: String,
        callback: @escaping (Result<PaymentIntent, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyPaymentIntentQuery(id: id),
            cachePolicy: .fetchIgnoringCacheCompletely
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedPaymentIntent = response.data?.getMyPaymentIntent?.fragments.fragmentPaymentIntent,
                    let paymentIntent = PaymentIntent(response: returnedPaymentIntent)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(paymentIntent))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
