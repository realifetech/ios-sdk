//
//  ProductModifierItemSelection.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierItemSelection: Codable, Equatable {

    public let productModifierItem: ProductModifierItem?
    public let quantity: Int?
    public let totalPrice: Int?

    public init(
        productModifierItem: ProductModifierItem?,
        quantity: Int?,
        totalPrice: Int?
    ) {
        self.productModifierItem = productModifierItem
        self.quantity = quantity
        self.totalPrice = totalPrice
    }
}

extension ProductModifierItemSelection {

    init(response: ApolloType.FragmentProductModifierItemSelection?) {
        productModifierItem = ProductModifierItem(
            response: response?
                .productModifierItem?
                .fragments
                .fragmentProductModifierItem)
        quantity = response?.quantity
        totalPrice = response?.totalPrice
    }
}
