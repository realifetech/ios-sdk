//
//  BasketItemInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct BasketItemInput {

    public let productId: String?
    public let productVariantId: String?
    public let fulfilmentPointId: String?
    public let quantity: Int?
    public let productModifierItems: [ProductModifierItemSelectionInput]?
}
