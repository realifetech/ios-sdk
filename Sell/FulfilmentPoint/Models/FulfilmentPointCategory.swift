//
//  FulfilmentPointCategory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct FulfilmentPointCategory: Codable, Equatable {

    public let id: String
    public let iconImageUrl: String?
    public let position: Int?
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        iconImageUrl: String?,
        position: Int?,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.iconImageUrl = iconImageUrl
        self.position = position
        self.translations = translations
    }
}

extension FulfilmentPointCategory {

    init?(response: ApolloType.FragmentFulfilmentPointCategory?) {
        guard let response = response else { return nil }
        id = response.id
        iconImageUrl = response.iconImageUrl
        position = response.position
        translations = response.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language?.rawValue,
                title: $0?.title)
        }
    }
}
