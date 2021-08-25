//
//  SellImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public class SellImplementing: Sell {

    public let product: ProductProvidable
    public let basket: BasketProvidable
    public let order: OrderProvidable
    public let fulfilmentPoint: FulfilmentPointProvidable
    public let payment: PaymentProvidable
    public let colorStore: ColorStorable

    public var orderingJourneyUrl: String

    public init(
        product: ProductProvidable,
        basket: BasketProvidable,
        order: OrderProvidable,
        fulfilmentPoint: FulfilmentPointProvidable,
        payment: PaymentProvidable,
        orderingJourneyUrl: String,
        colorStore: ColorStorable
    ) {
        self.product = product
        self.basket = basket
        self.order = order
        self.fulfilmentPoint = fulfilmentPoint
        self.payment = payment
        self.orderingJourneyUrl = orderingJourneyUrl
        self.colorStore = colorStore
    }

    public func createOrderingJourneyViewController() -> UIHostingController<OrderingJourneyView> {
        return OrderingJourneyViewController(urlString: orderingJourneyUrl, colorStore: colorStore)
    }

    public func createOrderingJourneyView() -> OrderingJourneyView {
        return OrderingJourneyView(urlString: orderingJourneyUrl, colorStore: colorStore)
    }
}
