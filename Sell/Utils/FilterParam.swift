//
//  FilterParam.swift
//  RealifeTech
//
//  Created by Mickey Lee on 26/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct FilterParam: Codable, Equatable {

    public let key: String
    public let value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

extension FilterParam {

    var apolloType: ApolloType.FilterParam {
        ApolloType.FilterParam(key: key, value: value)
    }
}
