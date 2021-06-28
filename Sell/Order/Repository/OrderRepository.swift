//
//  OrderRepository.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public final class OrderRepository {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    private func makeApolloOrderUpdateInput(_ input: OrderUpdateInput) -> ApolloType.OrderUpdateInput? {
        guard
            let status = input.status,
            let collectionPreferenceType = input.collectionPreferenceType
        else {
            return nil
        }
        return ApolloType.OrderUpdateInput(
            status: status.rawValue,
            collectionPreferenceType: collectionPreferenceType.apolloType,
            checkInTime: input.checkInTime)
    }
}

extension OrderRepository: OrderProvidable {

    public func getOrders(
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Order>, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyOrdersQuery(pageSize: pageSize, page: page),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let items = response.data?.getMyOrders?.edges?.compactMap {
                    Order(response: $0?.fragments.fragmentOrder)
                }
                let paginatedObject = PaginatedObject<Order>(
                    items: items ?? [],
                    nextPage: response.data?.getMyOrders?.nextPage)
                callback(.success(paginatedObject))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func getOrderById(
        id: String,
        callback: @escaping (Result<Order, Error>) -> Void
    ) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyOrderByIdQuery(id: id),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedOrder = response.data?.getMyOrder?.fragments.fragmentOrder,
                    let order = Order(response: returnedOrder)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(order))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    public func updateMyOrder(
        id: String,
        input: OrderUpdateInput,
        callback: @escaping (Result<Order, Error>) -> Void
    ) {
        graphQLManager.dispatchMutation(
            mutation: ApolloType.UpdateMyOrderMutation(id: id, input: makeApolloOrderUpdateInput(input)),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let response):
                guard
                    let returnedOrder = response.data?.updateMyOrder?.fragments.fragmentOrder,
                    let order = Order(response: returnedOrder)
                else {
                    return callback(.failure(GraphQLManagerError.noDataError))
                }
                callback(.success(order))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
