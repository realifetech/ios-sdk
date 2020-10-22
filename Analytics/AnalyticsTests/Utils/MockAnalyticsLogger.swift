//
//  MockAnalyticsLogger.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech

// Note: Current implementaion has matching signatures for LogEventSending & AnalyticsLogging, so we only need one mock
class MockAnalyticsLogger: AnalyticsLogging, LogEventSending {

    var eventLogged: AnalyticsEvent?
    var completionToSend: Result<Void, Error> = .success(())

    func logEvent(_ event: AnalyticsEvent, completion: @escaping (Result<Void, Error>) -> Void) {
        self.eventLogged = event
        completion(completionToSend)
    }
}
