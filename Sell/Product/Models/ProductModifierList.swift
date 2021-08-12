//
//  ProductModifierList.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct ProductModifierList: Codable, Equatable {

    public let id: String
    public let multipleSelect: Bool?
    public let mandatorySelect: Bool?
    public let maxAllowed: Int?
    public let items: [ProductModifierItem]?
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        multipleSelect: Bool?,
        mandatorySelect: Bool?,
        maxAllowed: Int?,
        items: [ProductModifierItem]?,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.multipleSelect = multipleSelect
        self.mandatorySelect = mandatorySelect
        self.maxAllowed = maxAllowed
        self.items = items
        self.translations = translations
    }
}

extension ProductModifierList {

    init?(response: ApolloType.FragmentProduct.ModifierList?) {
        guard let response = response else { return nil }
        id = response.id
        multipleSelect = response.multipleSelect
        mandatorySelect = response.mandatorySelect
        maxAllowed = response.maxAllowed
        items = response.items?.compactMap {
            ProductModifierItem(response: $0?.fragments.fragmentProductModifierItem)
        }
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}
