//
//  ProductGettable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol ProductGettable {
    func getProductById(
        _ id: String,
        completion: @escaping (Result<Product, Error>) -> Void)
    func getProducts(
        pageSize: Int,
        page: Int?,
        filters: ApolloType.ProductFilter?,
        completion: @escaping (Result<ApolloType.FragmentProducts, Error>) -> Void)
}
