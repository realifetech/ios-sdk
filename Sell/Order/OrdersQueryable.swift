//
//  OrdersQueryable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrdersQueryable {
    func getOrders(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<PaginatedObject<Order>, Error>) -> Void)

    func getOrderById(
        id: String,
        completion: @escaping (Result<Order, Error>) -> Void)

    func updateOrderStatus(
        id: String,
        status: String,
        completion: @escaping (Result<Order, Error>) -> Void)
}

// Theis protocol should be replaced some kind of model object, this could just wrap around the GraphQL object
public protocol Order {}
