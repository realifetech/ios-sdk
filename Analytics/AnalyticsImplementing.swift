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
    let storage = CodableStorage(storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())))

    public init(dispatcher: LogEventSending) {
        self.dispatcher = dispatcher
        getOfflineEvents()
    }

    public func logEvent(_ event: LoggingEvent, completion: @escaping (Error?) -> Void) {
        dispatcher.logEvent(event) { error in
            completion(error)
        }
    }

    func getOfflineEvents() {
        do {
            let cached: AnalyticsEvent = try storage.fetch(for: "event1")
            print(cached)
        } catch {
            print(error)
        }
    }

    func saveEventOffline(event: AnalyticsEvent) {
        do {
            try storage.save(event, for: "event1")
        } catch {
            print(error)
        }
    }
}
