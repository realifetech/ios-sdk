//
//  OrderingJourneyViewUpdater.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 22/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class OrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    public var orderingJourneyView: OrderingJourneyView?

    public func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        orderingJourneyView?.evaluate(javascript: javascript, completion: completion)
    }

    public func reload() {
        orderingJourneyView?.reload()
    }
}
