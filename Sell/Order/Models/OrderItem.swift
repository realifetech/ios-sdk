//
//  OrderItem.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct OrderItem {

    public let id: String
    public let product: Product?
    public let productVariant: ProductVariant?
    public let fulfilmentPoint: FulfilmentPoint?
    public let productModifierItems: [ProductModifierItemSelection]?
    public let price: Int?
    public let modifierItemsPrice: Int?
    public let quantity: Int?
    public let totalPrice: Int?
    public let title: String?
    public let subtitle: String?
    public let imageUrl: String?

    init?(response: ApolloType.FragmentOrder.Item?) {
        guard let response = response else { return nil }
        id = response.id
        product = Product(response: response.product?.fragments.fragmentProduct)
        productVariant = ProductVariant(response: response.productVariant?.fragments.fragmentProductVariant)
        fulfilmentPoint = FulfilmentPoint(response: response.fulfilmentPoint?.fragments.fragmentFulfilmentPoint)
        productModifierItems = response.productModifierItems?.compactMap {
            ProductModifierItemSelection(response: $0?.fragments.fragmentProductModifierItemSelection)
        }
        price = response.price
        modifierItemsPrice = response.modifierItemsPrice
        quantity = response.quantity
        totalPrice = response.totalPrice
        title = response.title
        subtitle = response.subtitle
        imageUrl = response.imageUrl
    }
}
