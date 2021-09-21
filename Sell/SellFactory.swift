//
//  SellFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum SellFactory {

    static func makeSellModule(
        graphQLManager: GraphQLManageable,
        orderingJourneyUrl: String,
        colorStore: ColorStorable
    ) -> Sell {
        return SellImplementing(
            product: ProductRepository(graphQLManager: graphQLManager),
            basket: BasketRepository(graphQLManager: graphQLManager),
            order: OrderRepository(graphQLManager: graphQLManager),
            fulfilmentPoint: FulfilmentPointRepository(graphQLManager: graphQLManager),
            payment: PaymentRepository(graphQLManager: graphQLManager),
            orderingJourneyUrl: orderingJourneyUrl,
            colorStore: colorStore,
            orderingJourneyViewUpdater: OrderingJourneyViewUpdater())
    }
}
