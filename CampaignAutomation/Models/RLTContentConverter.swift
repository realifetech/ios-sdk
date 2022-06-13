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
        var views: [RLTCreatable] = []
        for item in items {
            guard let factory = factories[item.contentType],
                  let creatable = factory.create(from: item.data)
            else { continue }
            views.append(creatable)
        }
        return views
    }
}
