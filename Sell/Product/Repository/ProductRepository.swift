//
//  ProductRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public final class ProductRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension ProductRepository: ProductProvidable {

    public func getProducts(
        pageSize: Int,
        page: Int,
        filters: ProductFilter,
        callback: (Result<PaginatedObject<Product>, Error>) -> Void
    ) {
        // TODO: ID-1025
    }
}
