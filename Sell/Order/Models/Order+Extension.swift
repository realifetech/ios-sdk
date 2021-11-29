//
//  Order+Extension.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2021/11/29.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public extension Order {

    var orderStatus: OrderStatus? {
        guard let status = status else { return nil }
        return OrderStatus(rawValue: status)
    }
}
