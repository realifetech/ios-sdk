//
//  ProductCategory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductCategory: Codable, Equatable {

    public let id: String
    public let position: Int?
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        position: Int?,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.position = position
        self.translations = translations
    }
}

extension ProductCategory {

    init?(response: ApolloType.FragmentProduct.Category?) {
        guard let response = response else { return nil }
        id = response.id
        position = response.position
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}
