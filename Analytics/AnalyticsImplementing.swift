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
        syncOfflineEvents()
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
            let dateStamp = Int(Date().timeIntervalSince1970)
            let storageName = event.storedName ?? "\(StorageType.loggingEvent.rawValue)-\(dateStamp)"
            var tmpEvent = event
            tmpEvent.storedName = storageName
            try storage.save(tmpEvent, for: storageName)
        } catch {
            #if APILOGGING
            print(error)
            #endif
        }
    }

    func syncOfflineEvents() {
        var offlineEvents: [LoggingEvent] = []
        do {
            offlineEvents = try storage.fetchAll(for: StorageType.loggingEvent.rawValue)
            let debouncedFunction = debounce(
                interval: 4000,
                queue: DispatchQueue.main,
                action: { (event: LoggingEvent) in
                    self.storage.delete(key: event.storedName ?? "")
                    self.logEvent(event) { _ in }
            })
            offlineEvents.forEach({ debouncedFunction($0) })
            #if APILOGGING
            print("getOfflineEvents: \(cached)")
            #endif
        } catch {
            #if APILOGGING
            print(error)
            #endif
        }
    }
}
