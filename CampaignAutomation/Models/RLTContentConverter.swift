//
//  RLTContentConverter.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/6/10.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation

public struct RLTContentConverter {

    public init() { }

    public func convert(factories: [RLTContentType: RLTCreatableFactory], items: [RLTContentItem]) -> [RLTCreatable] {
        return items.compactMap {
            factories[$0.contentType]?.create(from: $0.data)
        }
    }
}
