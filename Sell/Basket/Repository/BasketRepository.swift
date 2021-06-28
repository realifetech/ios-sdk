//
//  BasketRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Apollo

public final class BasketRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    private func transformErrorIfNeccessary(_ errors: [GraphQLError]?) -> BasketError? {
        guard let errors = errors else { return nil }
        for error in errors {
            switch error.extensions?["code"] as? String {
            case "SELL_BASKET_OUT_OF_STOCK":
                return .outOfStock
            case "SELL_BASKET_PRICE_CHANGE":
                return .priceChange
            case "SELL_BASKET_MIXED":
                return .mixedBasket
            case "SELL_BASKET_EMPTY":
                return .emptyBasket
            default:
                continue
            }
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
                    callback(.failure(.regularError(GraphQLManagerError.noDataError)))
                }
            case .failure(let error):
                callback(.failure(.regularError(error)))
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
                    callback(.failure(.regularError(GraphQLManagerError.noDataError)))
                }
            case .failure(let error):
                callback(.failure(.regularError(error)))
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
                    callback(.failure(.regularError(GraphQLManagerError.noDataError)))
                }
            case .failure(let error):
                callback(.failure(.regularError(error)))
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
                callback(.failure(.regularError(error)))
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
                    callback(.failure(.regularError(GraphQLManagerError.noDataError)))
                }
            case .failure(let error):
                callback(.failure(.regularError(error)))
            }
        }
    }
}
