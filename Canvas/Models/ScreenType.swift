//
//  ScreenType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public enum ScreenType: String {
    case discover
    case shop
    case events
    case wallet
    case booking
    case lineup
    case social
    case generic
}

extension ScreenType {

    var apolloType: ApolloType.ScreenType {
        return ApolloType.ScreenType(rawValue: rawValue) ?? .__unknown("")
    }
}
