//
//  SellImplementing.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class SellImplementing: Sell {

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    func getProductById(
        _ id: String,
        completion: @escaping (Result<ApolloType.FragmentProduct, Error>) -> Void
    ) {
        print("Got an ID of \(id)")
        completion(.failure(SellError.none))
    }

    func getProducts(
        pageSize: Int,
        page: Int,
        filters: ApolloType.ProductFilter,
        completion: @escaping (Result<[ApolloType.FragmentProduct], Error>) -> Void
    ) {
        print("We were asked for products with the following filters: \(filters). Page size: \(pageSize)")
        completion(.failure(SellError.none))
    }
}
