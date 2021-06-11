//
//  ProductQueryable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol ProductQueryable {
    func getProductById(
        id: String,
        completion: @escaping (Result<Product, Error>) -> Void)

    func getProducts(
        pageSize: Int,
        page: Int,
        filters: ProductFilter,
        completion: @escaping (Result<PaginatedObject<Product>, Error>) -> Void)
}

// These protocols should be replaced some kind of model object, this could just wrap around the GraphQL object
public protocol ProductFilter {}
public protocol Product {}
