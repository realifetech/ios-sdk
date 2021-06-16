//
//  Sell.swift
//  RealifeTech
//
//  Created by Olivier Butler on 03/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

//public typealias Sell = ProductGettable & OrdersGettable & PaymentsAccessible
public typealias Product = ApolloType.FragmentProduct
public typealias Order = ApolloType.FragmentOrder

public class Sell {

    public static var product: ProductGettable?
    public static var order: OrdersGettable?
    public static var payment: PaymentsAccessible?
}
