//
//  ProductProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol ProductProvidable {
    func getProducts(
        pageSize: Int,
        page: Int,
        filters: ProductFilterWrapper,
        callback: (Result<PaginatedObject<Product>, Error>) -> Void)
}
