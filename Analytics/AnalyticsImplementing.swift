//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class AnalyticsImplementing: AnalyticsLogging {

    let dispatcher: LogEventSending

    public init(dispatcher: LogEventSending) {
        self.dispatcher = dispatcher
    }

    public func logEvent(_ event: LoggingEvent, completion: @escaping (Result<Void, Error>) -> Void) {
        dispatcher.logEvent(event) { result in
            completion(result)
        }
    }
}
