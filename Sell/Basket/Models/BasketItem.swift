//
//  BasketItem.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct BasketItem {

    public let id: String
    public let price: Int?
    public let modifierItemsPrice: Int?
    public let quantity: Int?
    public let totalPrice: Int?
    public let fulfilmentPoint: FulfilmentPoint?
    public let productVariant: ProductVariant?
    public let product: Product?
    public let productModifierItems: [ProductModifierItemSelection]?

    init?(response: ApolloType.FragmentBasket.Item?) {
        guard let response = response else { return nil }
        id = response.id
        price = response.price
        modifierItemsPrice = response.modifierItemsPrice
        quantity = response.quantity
        totalPrice = response.totalPrice
        fulfilmentPoint = FulfilmentPoint(response: response.fulfilmentPoint?.fragments.fragmentFulfilmentPoint)
        productVariant = ProductVariant(response: response.productVariant?.fragments.fragmentProductVariant)
        product = Product(response: response.product?.fragments.fragmentProduct)
        productModifierItems = response.productModifierItems?.compactMap {
            ProductModifierItemSelection(response: $0?.fragments.fragmentProductModifierItemSelection)
        }
    }
}
