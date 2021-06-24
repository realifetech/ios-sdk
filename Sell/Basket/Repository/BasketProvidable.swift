//
//  BasketProvidable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol BasketProvidable {

    func getMyBasket(
        callback: @escaping (Result<Basket, BasketError>) -> Void)

    func createMyBasket(
        input: BasketInput,
        callback: @escaping (Result<Basket, BasketError>) -> Void)

    func updateMyBasket(
        input: BasketInput,
        callback: @escaping (Result<Basket, BasketError>) -> Void)

    func deleteMyBasket(
        callback: @escaping (Result<Bool, BasketError>) -> Void)

    func checkoutMyBasket(
        input: CheckoutInput,
        callback: @escaping (Result<Order, BasketError>) -> Void)
}

// TODO: ID-1027
public struct Order { }
