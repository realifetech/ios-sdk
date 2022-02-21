//
//  BasketRepositoryTestHelper.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 25/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL
@testable import RealifeTech

enum BasketRepositoryTestHelper {

    static let fragmentBasket = ApolloType.FragmentBasket(netAmount: 100)

    static let underTestBasketErrors: [BasketError.`Type`] = [
        .outOfStock,
        .priceChange,
        .mixedBasket,
        .emptyBasket,
        .timeslotAtCapacity,
        .regularError(GraphQLManagerError.noDataError)
    ]

    static func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: BasketRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = BasketRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }
}

extension ApolloType.FragmentBasket {

    init(netAmount: Int) {
        self = ApolloType.FragmentBasket()
        self.netAmount = netAmount
    }
}

extension BasketError {

    var errorCode: String {
        switch type {
        case .outOfStock:
            return "SELL_BASKET_OUT_OF_STOCK"
        case .priceChange:
            return "SELL_BASKET_PRICE_CHANGE"
        case .mixedBasket:
            return "SELL_BASKET_MIXED"
        case .emptyBasket:
            return "SELL_BASKET_EMPTY"
        case .timeslotAtCapacity:
            return "BASKET_TIMESLOT_AT_CAPACITY"
        default:
            return "default"
        }
    }
}
