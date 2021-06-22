//
//  FulfilmentPointRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 21/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public final class FulfilmentPointRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension FulfilmentPointRepository: FulfilmentPointProvidable {

    public func getFulfilmentPoints(
        pageSize: Int,
        page: Int,
        filters: FulfilmentPointFilter?,
        callback: @escaping (Result<PaginatedObject<FulfilmentPoint>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetFulfilmentPointsQuery(
                pageSize: pageSize,
                page: page,
                filters: nil), // TODO: BE will change categories: ID to categories: [ID]
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getFulfilmentPoints?.edges?.compactMap {
                    FulfilmentPoint(response: $0?.fragments.fragmentFulfilmentPoint)
                }
                let paginatedObject = PaginatedObject<FulfilmentPoint>(
                    items: items ?? [],
                    nextPage: response.data?.getFulfilmentPoints?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getFulfilmentPointById(
        id: String,
        callback: @escaping (Result<FulfilmentPoint, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetFulfilmentPointByIdQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedFulfilmentPoint = response.data?.getFulfilmentPoint?.fragments.fragmentFulfilmentPoint,
                    let fulfilmentPoint = FulfilmentPoint(response: returnedFulfilmentPoint)
                else {
                    return callback(.failure(GraphQLError.noDataError))
                }
                callback(.success(fulfilmentPoint))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getFulfilmentPointCategories(
        pageSize: Int,
        page: Int,
        callback: @escaping (Result<PaginatedObject<FulfilmentPointCategory>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetFulfilmentPointCategoriesQuery(pageSize: pageSize, page: page),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getFulfilmentPointCategories?.edges?.compactMap {
                    FulfilmentPointCategory(response: $0?.fragments.fragmentFulfilmentPointCategory)
                }
                let paginatedObject = PaginatedObject<FulfilmentPointCategory>(
                    items: items ?? [],
                    nextPage: response.data?.getFulfilmentPointCategories?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getFulfilmentPointCategoryById(
        id: String,
        callback: @escaping (Result<FulfilmentPointCategory, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetFulfilmentPointCategoryByIdQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let fulfilmentPointCategory = FulfilmentPointCategory(
                        response: response.data?.getFulfilmentPointCategory?.fragments.fragmentFulfilmentPointCategory)
                else {
                    return callback(.failure(GraphQLError.noDataError))
                }
                callback(.success(fulfilmentPointCategory))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
