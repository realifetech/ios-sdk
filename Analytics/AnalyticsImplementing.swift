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
        for savedEvent in getOfflineEvents() {
            logEvent(savedEvent) { _ in }
        }
    }

    public func logEvent(_ event: LoggingEvent, completion: @escaping (Result<Void, Error>) -> Void) {
        dispatcher.logEvent(event) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                self.saveEventOffline(event: event)
            }
        }
    }

    func saveEventOffline(event: LoggingEvent) {
        do {
            let eventName = "event-\(Int(Date().timeIntervalSince1970))"
            try storage.save(event, for: eventName)
        } catch {
            print(error)
        }
    }

    func getOfflineEvents() -> [LoggingEvent] {
        var offlineEvents: [LoggingEvent] = []
        do {
            offlineEvents = try storage.fetchAll(for: "event")
            #if APILOGGING
            print("getOfflineEvents: \(cached)")
            #endif
        } catch {
            #if APILOGGING
            print(error)
            #endif
        }
        return offlineEvents
    }
}
