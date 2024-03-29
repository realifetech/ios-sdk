//
//  WidgetStyle.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct WidgetStyle: Codable, Equatable {

    public let type: StyleType
    public let size: StyleSize
    public let padded: Bool

    public init(
        type: StyleType,
        size: StyleSize,
        padded: Bool
    ) {
        self.type = type
        self.size = size
        self.padded = padded
    }
}

extension WidgetStyle {

    init(response: ApolloType.FragmentWidget.Style?) {
        self.type = StyleType(apolloType: response?.type)
        self.size = StyleSize(apolloType: response?.size)
        self.padded = response?.padded ?? false
    }
}

public enum StyleType: String, Codable {

    case pager = "PAGER"
    case carousel = "CAROUSEL"
    case list = "LIST"

    init(apolloType: ApolloType.StyleType?) {
        self = StyleType(rawValue: apolloType?.rawValue ?? "") ?? .list
    }
}

public enum StyleSize: String, Codable {

    case small = "SMALL"
    case medium = "MEDIUM"
    case large = "LARGE"

    init(apolloType: ApolloType.StyleSize?) {
        self = StyleSize(rawValue: apolloType?.rawValue ?? "") ?? .small
    }
}
