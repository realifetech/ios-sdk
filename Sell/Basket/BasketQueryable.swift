//
//  BasketQueryable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 11/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol BasketQueryable {
    func getMyBasket(completion: @escaping (Result<Basket, Error>) -> Void)

    func createMyBasket(
        basket: BasketRequest,
        completion: @escaping (Result<Basket, Error>) -> Void)

    func updateMyBasket(
        basket: BasketRequest,
        completion: @escaping (Result<Basket, Error>) -> Void)

    func deleteMyBasket(completion: @escaping (Result<StandardSenderResponse, Error>) -> Void)

    func checkoutMyBasket(
        input: CheckoutWrapper,
        completion: @escaping (Result<Order, Error>) -> Void)
}

// These protocols should be replaced some kind of model object, this could just wrap around the GraphQL object
public protocol Basket {}
public protocol BasketRequest {}
public protocol CheckoutWrapper {}
// public protocol Order {} // Already defined in Order

