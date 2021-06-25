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
    public let productModifierItems: [ProductModifierItem]?
}
