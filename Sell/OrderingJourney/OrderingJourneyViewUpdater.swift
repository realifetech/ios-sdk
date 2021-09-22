//
//  OrderingJourneyViewUpdater.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 22/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class OrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    public var orderingJourneyView: OrderingJourneyViewUpdatable? {
        didSet {
            ensureUpdated()
        }
    }
    var javascriptToEvaluate: String?
    var reloadOnSuccessAfterEvaluation: Bool?
    var completionToFireAfterEvaluation: ((Any?, Error?) -> Void)?

    public func evaluate(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?) {
        if orderingJourneyView == nil {
            javascriptToEvaluate = javascript
            reloadOnSuccessAfterEvaluation = reloadOnSuccess
            completionToFireAfterEvaluation = completion
        }
        triggerEvaluation(javascript: javascript,
                          reloadOnSuccess: reloadOnSuccess,
                          completion: completion)
    }

    public func ensureUpdated() {
        guard let javascriptToEvaluate = javascriptToEvaluate,
              let reloadOnSuccessAfterEvaluation = reloadOnSuccessAfterEvaluation,
              orderingJourneyView != nil else { return }
        triggerEvaluation(javascript: javascriptToEvaluate,
                          reloadOnSuccess: reloadOnSuccessAfterEvaluation,
                          completion: completionToFireAfterEvaluation)
    }

    private func triggerEvaluation(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?) {
        orderingJourneyView?.evaluate(javascript: javascript, completion: { result, error in
            if error == nil && reloadOnSuccess {
                self.orderingJourneyView?.reload()
            }
            completion?(result, error)
        })
    }
}
