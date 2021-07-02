//
//  ProductModifierItem.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierItem: Codable, Equatable {

    public let id: String
    public let additionalPrice: Int?
    public let translations: [StandardTitleTranslation]?

    init?(response: ApolloType.FragmentProductModifierItem?) {
        guard let response = response else { return nil }
        id = response.id
        additionalPrice = response.additionalPrice
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}