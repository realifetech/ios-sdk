//
//  AnalyticsLogger.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class AnalyticsLogger: AnalyticsLogging {
    
    typealias PeristentQueueItem = QueueItem<AnalyticsEventAndCompletion>

    let dispatcher: LogEventSending
    let persistantQueue: PersistentQueue<AnalyticsEventAndCompletion>
    let reachabilityHelper: ReachabilityChecking

    var loopIsRunning: Bool = false

    public init(dispatcher: LogEventSending, reachabilityHelper: ReachabilityChecking) {
        self.dispatcher = dispatcher
        self.reachabilityHelper = reachabilityHelper
        self.persistantQueue = PersistentQueue<AnalyticsEventAndCompletion>(name: "analyticsEvent")
        startLoop()
    }

    func startLoop() {
        loopIsRunning = true
        let nextItemResult = self.persistantQueue.next
        switch nextItemResult {
        case .success(let frontOfQueue):
            self.loopStep(queueItem: frontOfQueue)
        case .failure:
            loopIsRunning = false
        }
    }

    func loopStep(queueItem: PeristentQueueItem) {
        let startOfStep: DispatchTime = .now()
        guard reachabilityHelper.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: startOfStep + .seconds(45)) {
                queueItem.releaseQueue(.doNothing)
                self.startLoop()
            }
            return
        }
        dispatcher.logEvent(queueItem.item.analyticsEvent) { result in
            // TODO: Add logic so that we only disgard from the queue in the case of non-server error
            queueItem.releaseQueue(.removeFirst)
            queueItem.item.analyticsCompletion?(result)
            switch result {
            case .success:
                self.startLoop()
            case .failure:
                DispatchQueue.main.asyncAfter(deadline: startOfStep + .seconds(45)) {
                    self.startLoop()
                }
            }
        }
    }

    public func logEvent(_ event: AnalyticsEvent, completion: @escaping EventLoggedCompletion) {
        let eventAndCompletion = AnalyticsEventAndCompletion(
            analyticsEvent: event,
            analyticsCompletion: completion)
        persistantQueue.addToQueue(eventAndCompletion)
        if !loopIsRunning { startLoop() }
    }
}
