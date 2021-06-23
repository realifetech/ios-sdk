//
//  Product.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct Product: Codable, Equatable {

    public let id: String
    public let images: [ProductImage]?
    public let modifierLists: [ProductModifierList]?
    public let variants: [ProductVariant]?
    public let categories: [ProductCategory]?
    public let fulfilmentPoints: [FulfilmentPoint]?
    public let translations: [StandardDescriptionTranslation]?
}
