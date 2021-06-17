//
//  ProductImplementing.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class ProductImplementing {

    private let repository: ProductProvidable

    init(repository: ProductProvidable) {
        self.repository = repository
    }
}

extension ProductImplementing: ProductImplementable {

    public func getProducts(
        pageSize: Int,
        page: Int,
        filters: ProductFilterWrapper,
        callback: (Result<PaginatedObject<Product>, Error>) -> Void
    ) {
        // TODO: ID-1025
    }
}
