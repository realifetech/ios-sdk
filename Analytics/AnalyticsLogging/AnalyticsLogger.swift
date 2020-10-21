//
//  AnalyticsLogger.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class AnalyticsLogger {

    typealias PeristentQueueItem = QueueItem<AnalyticsEventAndCompletion>

    private let failureDebounceMilliseconds: Int
    private let dispatcher: LogEventSending
    private let persistantQueue: PersistentQueue<AnalyticsEventAndCompletion>
    private let reachabilityHelper: ReachabilityChecking

    private var loopIsRunning: Bool = false

    public init(
        dispatcher: LogEventSending,
        reachabilityHelper: ReachabilityChecking,
        failureDebounceSeconds: Double = 45
    ) {
        self.dispatcher = dispatcher
        self.reachabilityHelper = reachabilityHelper
        self.persistantQueue = PersistentQueue<AnalyticsEventAndCompletion>(name: "analyticsEvent")
        self.failureDebounceMilliseconds = Int(failureDebounceSeconds * 1000)
        startLoop()
    }

    private func startLoop() {
        loopIsRunning = true
        let nextItemResult = self.persistantQueue.next
        switch nextItemResult {
        case .success(let frontOfQueue):
            self.loopStep(queueItem: frontOfQueue)
        case .failure:
            loopIsRunning = false
        }
    }

    private func loopStep(queueItem: PeristentQueueItem) {
        let delayTimeForFailure: DispatchTime = .now() + .milliseconds(failureDebounceMilliseconds)
        guard reachabilityHelper.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: delayTimeForFailure) {
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
                DispatchQueue.main.asyncAfter(deadline: delayTimeForFailure) {
                    self.startLoop()
                }
            }
        }
    }
}

extension AnalyticsLogger: AnalyticsLogging {

    public func logEvent(_ event: AnalyticsEvent, completion: @escaping EventLoggedCompletion) {
        let eventAndCompletion = AnalyticsEventAndCompletion(
            analyticsEvent: event,
            analyticsCompletion: completion)
        persistantQueue.addToQueue(eventAndCompletion)
        if !loopIsRunning { startLoop() }
    }
}
