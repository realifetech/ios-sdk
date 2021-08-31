//
//  ProductModifierItem.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct ProductModifierItem: Codable, Equatable, Hashable {

    public let id: String
    public let status: ProductModifierItemStatus?
    public let additionalPrice: Int?
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        status: ProductModifierItemStatus?,
        additionalPrice: Int?,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.status = status
        self.additionalPrice = additionalPrice
        self.translations = translations
    }
}

extension ProductModifierItem {

    init?(response: ApolloType.FragmentProductModifierItem?) {
        guard let response = response else { return nil }
        id = response.id
        status = ProductModifierItemStatus(response: response.status)
        additionalPrice = response.additionalPrice
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}
