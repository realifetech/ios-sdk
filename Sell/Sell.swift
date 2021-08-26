//
//  Sell.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public protocol Sell {
    var product: ProductProvidable { get }
    var basket: BasketProvidable { get }
    var order: OrderProvidable { get }
    var fulfilmentPoint: FulfilmentPointProvidable { get }
    var payment: PaymentProvidable { get }
    var orderingJourneyUrl: String { get set }

    func createOrderingJourneyViewController() -> UIHostingController<OrderingJourneyView>
    func createOrderingJourneyView() -> OrderingJourneyView
}
