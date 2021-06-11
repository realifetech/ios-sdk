//
//  PaginatedObject.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct PaginatedObject<Model> {
    public var items: [Model]?
    public var nextPage: Int?
}
