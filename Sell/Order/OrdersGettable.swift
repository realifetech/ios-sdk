//
//  OrdersGettable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrdersGettable: SellCachingManageable {
    func getOrders(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentOrders.Edge?], Error>) -> Void)
}

public struct OrderRetriever: OrdersGettable {

    public let isUserBaedObject: Bool = true
    let dispatcher: GraphQLDispatching

    public func getOrders(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentOrders.Edge?], Error>) -> Void
    ) {
        dispatcher.dispatch(
            query: ApolloType.GetOrdersQuery(pageSize: 10),
            cachePolicy: .returnCacheDataAndFetch) { result in
            switch result {
            case .success(let response):
                print(response)
                guard let items = response.data?.me?.orders?.fragments.fragmentOrders.edges else {
                    return completion(.failure(ContentError.urlIsEmpty))
                }
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

public protocol FulfilmentPointCategoryRetrievable: SellCachingManageable {

    func getFulfilmentPointCategories(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentFulfilmentPointCategory], Error>) -> Void)

    func getFulfilmentPointCategoryById(
        _ id: String,
        completion: @escaping (Result<ApolloType.FragmentFulfilmentPointCategory, Error>) -> Void)
}

public struct FulfilmentPointCategoryRetriever: FulfilmentPointCategoryRetrievable {

    public let isUserBaedObject: Bool = false

    public func getFulfilmentPointCategories(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentFulfilmentPointCategory], Error>) -> Void) { }

    public func getFulfilmentPointCategoryById(
        _ id: String,
        completion: @escaping (Result<ApolloType.FragmentFulfilmentPointCategory, Error>) -> Void) { }
}
