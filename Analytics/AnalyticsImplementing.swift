//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation


struct AnalyticsLogEventAndCompletion: Identifiable {
    let id: UUID = UUID()
    let event: AnalyticsEvent
    let completion: AnalyticsImplementing.EventLoggedCompletion?
}

extension AnalyticsLogEventAndCompletion: Equatable {
    static func == (lhs: AnalyticsLogEventAndCompletion, rhs: AnalyticsLogEventAndCompletion) -> Bool {
        return lhs.event == rhs.event
    }
}

extension AnalyticsLogEventAndCompletion: Encodable {
    enum CodingKeys: String, CodingKey {
        case event
    }
}

extension AnalyticsLogEventAndCompletion: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        event = try values.decode(AnalyticsEvent.self, forKey: .event)
        completion = nil
    }
}

public class AnalyticsImplementing: AnalyticsLogging {

    public typealias EventLoggedCompletion = (Result<Void, Error>) -> Void
    typealias PeristentQueueItem = PersistantQueueItem<AnalyticsLogEventAndCompletion>

    let dispatcher: LogEventSending
    let persistantQueue: PersistantQueue<AnalyticsLogEventAndCompletion>
    let dispatchQueue: DispatchQueue
    let semaphore = DispatchSemaphore(value: 1)
    let reachabilityHelper: ReachabilityChecking

    var loopIsRunning: Bool = false

    public init(dispatcher: LogEventSending, reachabilityHelper: ReachabilityChecking) {
        self.dispatcher = dispatcher
        self.reachabilityHelper = reachabilityHelper
        self.dispatchQueue = DispatchQueue(
            label: "Revice registration queue",
            qos: .background)
        self.persistantQueue = PersistantQueue<AnalyticsLogEventAndCompletion>()
        startLoop()
    }

    func startLoop() {
        loopIsRunning = true
        let nextItemResult = self.persistantQueue.getNextQueueItem()
        switch nextItemResult {
        case .success(let frontOfQueue):
            self.loopStep(queueItem: frontOfQueue)
            self.startLoop()
        case .failure:
            break
        }
    }

    func loopStep(queueItem: PeristentQueueItem) {
        guard reachabilityHelper.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(45000)) {
                queueItem.itemCompletion(.nothing)
                self.startLoop()
            }
            return
        }
        print("Loggin an event")
        dispatcher.logEvent(queueItem.item.event) { result in
            switch result {
            case .success:
                print("SUCCESS Loggin an event")
                queueItem.itemCompletion(.removeFirst)
                self.startLoop()
                // self.semaphore.signal()
            case .failure:
                print("FAILURE Loggin an event")
                queueItem.itemCompletion(.removeFirst)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(45)) {
                    // self.semaphore.signal()
                    self.startLoop()
                }
            }

        }
    }

    public func logEvent(_ event: AnalyticsEvent, completion: @escaping EventLoggedCompletion) {
        print("Added event to the log")
        let logEventAndCompletion = AnalyticsLogEventAndCompletion(event: event, completion: completion)
        persistantQueue.addToQueue(logEventAndCompletion)
        if !loopIsRunning { startLoop() }
    }
}
