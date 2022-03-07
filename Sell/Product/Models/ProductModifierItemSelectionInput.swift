//
//  ProductModifierItemSelectionInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 24/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierItemSelectionInput: Equatable {

    public let productModifierItemId: String?
    public var quantity: Int?

    public init(productModifierItemId: String?, quantity: Int?) {
        self.productModifierItemId = productModifierItemId
        self.quantity = quantity
    }
}
