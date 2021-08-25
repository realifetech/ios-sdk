//
//  ProductFilter.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductFilter {

    public let fulfilmentPointIds: [String]?
    public let categoriesIds: [String]?

    public init(fulfilmentPointIds: [String]?, categoriesIds: [String]?) {
        self.fulfilmentPointIds = fulfilmentPointIds
        self.categoriesIds = categoriesIds
    }
}
