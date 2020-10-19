//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public class AnalyticsImplementing: AnalyticsLogging {

    public typealias EventLoggedCompletion = (Result<Void, Error>) -> Void

    let dispatcher: LogEventSending
    let storage = CodableStorage(storage: DiskStorage(path: URL(fileURLWithPath: NSTemporaryDirectory())))
    var logEventQueue: [(LoggingEvent, EventLoggedCompletion?)] = [] {
        didSet {
            if oldValue.isEmpty && !logEventQueue.isEmpty {
                startLoop()
            }
        }
    }
    let dispatchQueue: DispatchQueue
    let semaphore = DispatchSemaphore(value: 1)
    let reachabilityHelper: ReachabilityChecking

    public init(dispatcher: LogEventSending, reachabilityHelper: ReachabilityChecking) {
        self.dispatcher = dispatcher
        self.reachabilityHelper = reachabilityHelper
        self.dispatchQueue = DispatchQueue(
            label: "Revice registration queue",
            qos: .background)
        syncOfflineEvents()
        startLoop()
    }

    func startLoop() {
        dispatchQueue.async { // TODO: Start queue when we go from 0 items to some
            self.semaphore.wait()
            guard !self.logEventQueue.isEmpty else {
                    self.semaphore.signal()
                    return
            }
            let eventAndCompletion = self.logEventQueue.removeFirst()
            self.loopStep(logEvent: eventAndCompletion.0, completion: eventAndCompletion.1)
            self.startLoop()
        }
    }

    func loopStep(logEvent: LoggingEvent, completion: EventLoggedCompletion?) {
        // guard reachabilityHelper.hasNetworkConnection else {
        guard true else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(45000)) {
                self.loopStep(logEvent: logEvent, completion: completion)
            }
            return
        }
        print("Loggin an event")
        dispatcher.logEvent(logEvent) { result in
            switch result {
            case .success:
                print("SUCCESS Loggin an event")
                completion?(result)
            case .failure:
                print("FAILURE Loggin an event")
                self.logEventQueue.append((logEvent, completion))
            }
            self.semaphore.signal()
        }
    }

    public func logEvent(_ event: LoggingEvent, completion: @escaping EventLoggedCompletion) {
        print("Added event to the log")
        logEventQueue.append((event, completion))
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
        do {
            let newItems: [LoggingEvent] = try storage.fetchAll(for: StorageType.loggingEvent.rawValue)
            let tuples: [(LoggingEvent, EventLoggedCompletion?)] = newItems.map { logEvent in
                return (logEvent, nil)
            }
            logEventQueue.append(contentsOf: tuples)
//            let debouncedFunction = debounce(
//                interval: 45000,
//                queue: DispatchQueue.main,
//                action: { (event: LoggingEvent) in
//                    self.storage.delete(key: event.storedName ?? "")
//                    self.logEvent(event) { _ in }
//            })
//            offlineEvents.forEach({ debouncedFunction($0) })
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
