//
//  BasketRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL
import Apollo

public final class BasketRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    private func transformErrorIfNeccessary(_ errors: [GraphQLError]?) -> BasketError? {
        guard let errors = errors else { return nil }
        let basketErrors = errors.map { BasketError(graphQLError: $0) }
        if !basketErrors.isEmpty, let first = basketErrors.first {
            return BasketError(type: first.type, message: basketErrors.combinedErrorMessage)
        }
        return nil
    }

    private func makeApolloBasketInput(_ input: BasketInput) -> ApolloType.BasketInput {
        ApolloType.BasketInput(
            collectionDate: input.collectionDate?.iso8601String,
            collectionPreferenceType: input.collectionPreferenceType?.apolloType,
            timeslot: input.timeslotId,
            fulfilmentPoint: input.fulfilmentPointId,
            seatInfo: ApolloType.SeatInfoInput(
                row: input.seatInfo?.row,
                seat: input.seatInfo?.seat,
                block: input.seatInfo?.block,
                table: input.seatInfo?.table),
            items: input.items.compactMap {
                ApolloType.BasketItemInput(
                    product: $0.productId,
                    productVariant: $0.productVariantId,
                    fulfilmentPoint: $0.fulfilmentPointId,
                    quantity: $0.quantity,
                    productModifierItems: $0.productModifierItems?.compactMap {
                        ApolloType.ProductModifierItemSelectionInput(
                            productModifierItemId: $0.productModifierItemId,
                            quantity: $0.quantity)
                    }
                )
            }
        )
    }

    private func makeApolloCheckoutInput(_ input: CheckoutInput) -> ApolloType.CheckoutInput {
        ApolloType.CheckoutInput(
            netAmount: input.netAmount,
            language: ApolloType.Language(rawValue: input.language ?? ""))
    }
}

extension BasketRepository: BasketProvidable {

    public func getMyBasket(
        callback: @escaping (Result<Basket, BasketError>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyBasketQuery(),
            cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .success(let response):
                if let transformedError = self.transformErrorIfNeccessary(response.errors) {
                    callback(.failure(transformedError))
                } else if let returnedBasket = response.data?.getMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                let basketError = BasketError(
                    type: .regularError(error),
                    message: error.localizedDescription)
                callback(.failure(basketError))
            }
        }
    }

    public func createMyBasket(
        input: BasketInput,
        callback: @escaping (Result<Basket, BasketError>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.CreateMyBasketMutation(input: makeApolloBasketInput(input)),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                if let transformedError = self.transformErrorIfNeccessary(response.errors) {
                    callback(.failure(transformedError))
                } else if let returnedBasket = response.data?.createMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                let basketError = BasketError(
                    type: .regularError(error),
                    message: error.localizedDescription)
                callback(.failure(basketError))
            }
        }
    }

    public func updateMyBasket(
        input: BasketInput,
        callback: @escaping (Result<Basket, BasketError>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.UpdateMyBasketMutation(input: makeApolloBasketInput(input)),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                if let transformedError = self.transformErrorIfNeccessary(response.errors) {
                    callback(.failure(transformedError))
                } else if let returnedBasket = response.data?.updateMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                let basketError = BasketError(
                    type: .regularError(error),
                    message: error.localizedDescription)
                callback(.failure(basketError))
            }
        }
    }

    public func deleteMyBasket(
        callback: @escaping (Result<Bool, BasketError>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.DeleteMyBasketMutation(),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                if let transformedError = self.transformErrorIfNeccessary(response.errors) {
                    callback(.failure(transformedError))
                } else {
                    callback(.success(response.data?.deleteMyBasket?.success ?? false))
                }
            case .failure(let error):
                let basketError = BasketError(
                    type: .regularError(error),
                    message: error.localizedDescription)
                callback(.failure(basketError))
            }
        }
    }

    public func checkoutMyBasket(
        input: CheckoutInput,
        callback: @escaping (Result<Order, BasketError>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.CheckoutMyBasketMutation(input: makeApolloCheckoutInput(input)),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                if let transformedError = self.transformErrorIfNeccessary(response.errors) {
                    callback(.failure(transformedError))
                } else if let order = Order(response: response.data?.checkoutMyBasket?.fragments.fragmentOrder) {
                    callback(.success(order))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                let basketError = BasketError(
                    type: .regularError(error),
                    message: error.localizedDescription)
                callback(.failure(basketError))
            }
        }
    }
}
