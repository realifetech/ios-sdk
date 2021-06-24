//
//  SellImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class SellImplementing: Sell {

    public let product: ProductProvidable
    public let basket: BasketProvidable
    public let fulfilmentPoint: FulfilmentPointProvidable

    public init(
        product: ProductProvidable,
        basket: BasketProvidable,
        fulfilmentPoint: FulfilmentPointProvidable
    ) {
        self.product = product
        self.basket = basket
        self.fulfilmentPoint = fulfilmentPoint
    }
}
