//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class AnalyticsImplementing: Analytics {

    let analyticsLogger: AnalyticsLogging

    init(analyticsLogger: AnalyticsLogging) {
        self.analyticsLogger = analyticsLogger
    }

    func logEvent(_ event: AnalyticsEvent, completion: @escaping (Result<Void, Error>) -> Void) {
        analyticsLogger.logEvent(event, completion: completion)
    }
}
