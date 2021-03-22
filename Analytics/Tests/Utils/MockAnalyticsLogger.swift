//
//  MockAnalyticsLogger.swift
//  RealifeTechTests
//
//  Created by Olivier Butler on 22/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
@testable import RealifeTech

// Note: Current implementaion has matching signatures for LogEventSending & AnalyticsLogging, so we only need one mock
final class MockAnalyticsLogger: AnalyticsLogging, LogEventSending {

    var eventsLogged: [AnalyticEvent] = []
    var completionToSend: Result<Bool, Error> = .success(true)

    func logEvent(_ event: AnalyticEvent, completion: @escaping (Result<Bool, Error>) -> Void) {
        self.eventsLogged.append(event)
        completion(completionToSend)
    }
}
