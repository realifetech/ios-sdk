//
//  AnalyticsFactory.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public enum AnalyticsFactory {
    static func makeAnalyticsModule(
        dispatcher: LogEventSending,
        reachabilityHelper: ReachabilityChecking,
        deviceRegisteredValue: ReadOnlyCurrentValue<Bool>
    ) -> Analytics {
        let queue = PersistentQueue<AnalyticEventAndCompletion>(name: "analyticsEvent")
        let analyticsLogger = AnalyticsLogger(
            dispatcher: dispatcher,
            reachabilityHelper: reachabilityHelper,
            persistentQueue: AnyQueue(queue),
            deviceRegisteredValue: deviceRegisteredValue)
        return AnalyticsImplementing(analyticsLogger: analyticsLogger)
    }
}
