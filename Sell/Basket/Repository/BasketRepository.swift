//
//  BasketRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif
import Apollo

public final class BasketRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    private func transformErrorIfNeccessary(_ error: GraphQLError?) -> BasketError? {
        guard let error = error else { return nil }
        let basketError = BasketError(graphQLError: error)
        return BasketError(type: basketError.type, message: basketError.message)
    }

    private func handleBasketError<T>(_ error: Error, callback: @escaping (Result<T, BasketError>) -> Void) {
        if let error = error as? GraphQLError,
           let transformedError = self.transformErrorIfNeccessary(error) {
            callback(.failure(transformedError))
        } else {
            let basketError = BasketError(
                type: .regularError(error),
                message: error.localizedDescription)
            callback(.failure(basketError))
        }
    }

    private func makeApolloBasketInput(_ input: BasketInput) -> ApolloType.BasketInput {
        ApolloType.BasketInput(
            collectionDate: input.collectionDate?.apiParameterDateFormat,
            collectionPreferenceType: input.collectionPreferenceType?.apolloType,
            timeslot: input.timeslotId,
            fulfilmentPoint: input.fulfilmentPointId,
            seatInfo: input.seatInfo,
            items: input.items.compactMap {
                ApolloType.BasketItemInput(
                    id: $0.id,
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
                if let returnedBasket = response.data?.getMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(type: .emptyBasket, message: "")
                    callback(.failure(basketError))
                }
            case .failure(let error):
                self.handleBasketError(error, callback: callback)
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
                if let returnedBasket = response.data?.createMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                self.handleBasketError(error, callback: callback)
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
                if let returnedBasket = response.data?.updateMyBasket?.fragments.fragmentBasket {
                    callback(.success(Basket(response: returnedBasket)))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                self.handleBasketError(error, callback: callback)
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
                callback(.success(response.data?.deleteMyBasket.success ?? false))
            case .failure(let error):
                self.handleBasketError(error, callback: callback)
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
                if let order = Order(response: response.data?.checkoutMyBasket?.fragments.fragmentOrder) {
                    callback(.success(order))
                } else {
                    let basketError = BasketError(
                        type: .regularError(GraphQLManagerError.noDataError),
                        message: GraphQLManagerError.noDataError.localizedDescription)
                    callback(.failure(basketError))
                }
            case .failure(let error):
                self.handleBasketError(error, callback: callback)
            }
        }
    }
}
