//
//  ProductModifierItemSelection.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierItemSelection {

    public let productModifierItem: ProductModifierItem?
    public let quantity: Int?
    public let totalPrice: Int?

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
