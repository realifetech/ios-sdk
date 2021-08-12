//
//  Widget.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct Widget: Codable, Equatable {

    public let id: String
    public let widgetType: WidgetType?
    public let style: WidgetStyle?
    public let viewAllUrl: String?
    public let variation: WidgetVariation?

    public init(
        id: String,
        widgetType: WidgetType?,
        style: WidgetStyle?,
        viewAllUrl: String?,
        variation: WidgetVariation?
    ) {
        self.id = id
        self.widgetType = widgetType
        self.style = style
        self.viewAllUrl = viewAllUrl
        self.variation = variation
    }
}

extension Widget {

    init?(response: ApolloType.FragmentWidget?) {
        guard let response = response else { return nil }
        id = response.id
        widgetType = WidgetType(apolloType: response.widgetType)
        style = WidgetStyle(response: response.style)
        viewAllUrl = response.viewAllUrl
        variation = WidgetVariation(response: response.variation)
    }
}
