//
//  ProductProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol ProductProvidable {

    func getProducts(
        pageSize: Int,
        page: Int?,
        filters: ProductFilter?,
        callback: @escaping (Result<PaginatedObject<Product>, Error>) -> Void)

    func getProductById(
        id: String,
        callback: @escaping (Result<Product, Error>) -> Void)
}
