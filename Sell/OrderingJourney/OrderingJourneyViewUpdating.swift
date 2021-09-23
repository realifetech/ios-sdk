//
//  OrderingJourneyViewUpdating.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 21/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol OrderingJourneyViewUpdating {
    var orderingJourneyView: OrderingJourneyViewUpdatable? { get set }
    func evaluate(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?)
}
