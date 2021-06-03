//
//  OrdersGettable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrdersGettable {
    func getOrders(
        pageSize: Int,
        page: Int,
        completion: @escaping (Result<[ApolloType.FragmentOrder], Error>) -> Void)
}
