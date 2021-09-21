//
//  OrderingJourneyViewUpdating.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrderingJourneyViewUpdating {
    var orderingJourneyView: OrderingJourneyView? { get set }
    func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?)
    func reload()
}

public class OrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    public var orderingJourneyView: OrderingJourneyView?

    public func evaluate(javascript: String, completion: ((Any?, Error?) -> Void)?) {
        orderingJourneyView?.evaluate(javascript: javascript, completion: completion)
    }

    public func reload() {
        orderingJourneyView?.reload()
    }
}
