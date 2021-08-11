//
//  WidgetVariation.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct WidgetVariation: Codable, Equatable {

    public let fetchType: WidgetFetchType?
    public let contentIds: [String]?
    public let translations: [StandardTitleTranslation]?
    public let params: [WidgetParam]?
    public let engagementParams: [WidgetParam]?

    public init(
        fetchType: WidgetFetchType?,
        contentIds: [String]?,
        translations: [StandardTitleTranslation]?,
        params: [WidgetParam]?,
        engagementParams: [WidgetParam]?
    ) {
        self.fetchType = fetchType
        self.contentIds = contentIds
        self.translations = translations
        self.params = params
        self.engagementParams = engagementParams
    }
}

extension WidgetVariation {

    init(response: ApolloType.FragmentWidget.Variation?) {
        fetchType = WidgetFetchType(apolloType: response?.fetchType)
        contentIds = response?.contentIds?.compactMap { $0 }
        translations = response?.translations?.compactMap {
            StandardTitleTranslation(
                language: $0?.language.rawValue,
                title: $0?.title)
        }
        params = response?.params?.compactMap {
            WidgetParam(key: $0?.key, value: $0?.value)
        }
        engagementParams = response?.params?.compactMap {
            WidgetParam(key: $0?.key, value: $0?.value)
        }
    }
}
