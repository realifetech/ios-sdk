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

    init?(response: ApolloType.FragmentProduct?) {
        guard let response = response else { return nil }
        id = response.id
        images = response.images?.compactMap {
            ProductImage(response: $0)
        }
        modifierLists = response.modifierLists?.compactMap {
            ProductModifierList(response: $0)
        }
        variants = response.variants?.compactMap {
            ProductVariant(response: $0?.fragments.fragmentProductVariant)
        }
        categories = response.categories?.compactMap {
            ProductCategory(response: $0)
        }
        fulfilmentPoints = response.fulfilmentPoints?.compactMap {
            FulfilmentPoint(response: $0?.fragments.fragmentFulfilmentPoint)
        }
        translations = response.translations?.compactMap {
            StandardDescriptionTranslation(
                language: $0?.language,
                title: $0?.title,
                description: $0?.description)
        }
    }
}
