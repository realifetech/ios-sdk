//
//  PaginatedObject.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaginatedObject<Model: Equatable>: Equatable {

    public let items: [Model]
    public let nextPage: Int?

    public init(items: [Model], nextPage: Int?) {
        self.items = items
        self.nextPage = nextPage
    }
}
