//
//  ProductVariant.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct ProductVariant: Codable, Equatable {

    public let id: String
    public let price: Int?
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        price: Int?,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.price = price
        self.translations = translations
    }
}

extension ProductVariant {

    init?(response: ApolloType.FragmentProductVariant?) {
        guard let response = response else { return nil }
        id = response.id
        price = response.price
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}
