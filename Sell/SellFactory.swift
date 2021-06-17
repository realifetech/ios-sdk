//
//  SellFactory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum SellFactory {

    static func makeSellModule(graphQLDispatcher: GraphQLDispatching) -> Sell {
        let productRepository = ProductRepository(dispatcher: graphQLDispatcher)
        return SellImplementing(
            product: ProductImplementing(repository: productRepository))
    }
}
