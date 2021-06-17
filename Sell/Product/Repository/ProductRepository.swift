//
//  ProductRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 17/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

final class ProductRepository {

    private let dispatcher: GraphQLDispatching

    init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }
}

extension ProductRepository: ProductProvidable {

    func getProducts(
        pageSize: Int,
        page: Int,
        filters: ProductFilterWrapper,
        callback: (Result<PaginatedObject<Product>, Error>) -> Void
    ) {
        // TODO: ID-1025
    }
}
