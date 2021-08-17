//
//  WidgetFetchType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum WidgetFetchType: String, Codable {

    case featured
    case feed
    case `static`

    init?(apolloType: ApolloType.WidgetFetchType?) {
        guard let type = WidgetFetchType(rawValue: apolloType?.rawValue ?? "") else {
            return nil
        }
        self = type
    }
}
