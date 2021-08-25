//
//  OrderProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrderProvidable {

    func getOrders(
        pageSize: Int,
        page: Int?,
        callback: @escaping (Result<PaginatedObject<Order>, Error>) -> Void)

    func getOrderById(
        id: String,
        callback: @escaping (Result<Order, Error>) -> Void)

    func updateMyOrder(
        id: String,
        input: OrderUpdateInput,
        callback: @escaping (Result<Order, Error>) -> Void)
}
