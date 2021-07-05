//
//  PaginatedObject.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaginatedObject<Model>: Equatable {
    let items: [Model]
    let nextPage: Int?
}
