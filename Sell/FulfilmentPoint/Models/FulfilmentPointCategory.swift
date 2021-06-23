//
//  FulfilmentPointCategory.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct FulfilmentPointCategory: Codable, Equatable {

    public let id: String
    public let iconImageUrl: String?
    public let position: Int?
    public let translations: [StandardTitleTranslation]?

    init?(response: ApolloType.FragmentFulfilmentPointCategory?) {
        guard let response = response else { return nil }
        id = response.id
        iconImageUrl = response.iconImageUrl
        position = response.position
        translations = response.translations?.compactMap {
            StandardTitleTranslation(response: $0)
        }
    }
}
