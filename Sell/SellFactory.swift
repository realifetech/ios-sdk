//
//  SellFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum SellFactory {

    static func makeSellModule(graphQLManager: GraphQLManageable) -> Sell {
        return SellImplementing(
            product: ProductRepository(graphQLManager: graphQLManager),
            basket: BasketRepository(graphQLManager: graphQLManager),
            fulfilmentPoint: FulfilmentPointRepository(graphQLManager: graphQLManager))
    }
}
