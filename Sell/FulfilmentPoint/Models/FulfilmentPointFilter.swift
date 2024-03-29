//
//  FulfilmentPointFilter.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct FulfilmentPointFilter {

    public let categories: [String]?

    public init(categories: [String]?) {
        self.categories = categories
    }
}

extension FulfilmentPointFilter {

    var apolloType: ApolloType.FulfilmentPointFilter {
        ApolloType.FulfilmentPointFilter(categories: categories)
    }
}
