//
//  OrderingJourneyViewUpdater.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 22/09/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

/*
 This class will retain jsRunDetails until there is an OrderingJourneyView to pass it to.
 Once passed, it will let go and let the view handle the execution
 Doing the above allows for JS to be executed when the web view next opens, if it's not already open.
 */
public class OrderingJourneyViewUpdater: OrderingJourneyViewUpdating {

    public var orderingJourneyView: OrderingJourneyViewUpdatable? {
        didSet {
            evaluateSavedJavascript()
        }
    }
    public var javascriptRunDetails: JavascriptRunDetails?

    public func evaluate(javascript: String, reloadOnSuccess: Bool, completion: ((Any?, Error?) -> Void)?) {
        let javascriptRunDetails = JavascriptRunDetails(javascript: javascript,
                                                        reloadOnSuccess: reloadOnSuccess,
                                                        completion: completion)
        triggerEvaluation(javascriptRunDetails: javascriptRunDetails)
    }

    public func evaluateSavedJavascript() {
        guard let javascriptRunDetails = javascriptRunDetails else { return }
        triggerEvaluation(javascriptRunDetails: javascriptRunDetails)
    }

    private func triggerEvaluation(javascriptRunDetails: JavascriptRunDetails) {
        guard orderingJourneyView != nil else {
            self.javascriptRunDetails = javascriptRunDetails
            return
        }
        orderingJourneyView?.evaluate(javascriptRunDetails: javascriptRunDetails)
        self.javascriptRunDetails = nil
    }
}
