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

    private func makeApolloProductFilters(_ filters: ProductFilter?) -> ApolloType.ProductFilter? {
        guard let filters = filters else { return nil }
        return ApolloType.ProductFilter(
            fulfilmentPoints: filters.fulfilmentPointIds,
            categories: filters.categoriesIds)
    }
}

extension ProductRepository: ProductProvidable {

    public func getProducts(
        pageSize: Int,
        page: Int?,
        filters: ProductFilter?,
        callback: @escaping (Result<PaginatedObject<Product>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetProductsQuery(
                pageSize: pageSize,
                page: page,
                filters: makeApolloProductFilters(filters)),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getProducts?.edges?.compactMap {
                    Product(response: $0?.fragments.fragmentProduct)
                }
                let paginatedObject = PaginatedObject<Product>(
                    items: items ?? [],
                    nextPage: response.data?.getProducts?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getProductById(
        id: String,
        callback: @escaping (Result<Product, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetProductByIdQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedProduct = response.data?.getProduct?.fragments.fragmentProduct,
                    let product = Product(response: returnedProduct)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(product))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
