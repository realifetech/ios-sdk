//
//  Sell.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol Sell {
    var product: ProductProvidable { get }
    var basket: BasketProvidable { get }
    var order: OrderProvidable { get }
    var fulfilmentPoint: FulfilmentPointProvidable { get }
    var payment: PaymentProvidable { get }
}
