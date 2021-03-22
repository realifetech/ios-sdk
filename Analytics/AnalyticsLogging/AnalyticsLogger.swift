//
//  AnalyticsLogger.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

class AnalyticsLogger {

    typealias PeristentQueueItem = QueueItem<AnalyticEventAndCompletion>

    private let failureDebounceMilliseconds: Int
    private let dispatcher: LogEventSending
    private let persistentQueue: AnyQueue<AnalyticEventAndCompletion>
    private let reachabilityHelper: ReachabilityChecking
    private let deviceRegistering: DeviceRegistering

    private var loopIsRunning: Bool = false

    public init(
        dispatcher: LogEventSending,
        reachabilityHelper: ReachabilityChecking,
        persistentQueue: AnyQueue<AnalyticEventAndCompletion>,
        failureDebounceSeconds: Double = 45,
        deviceRegistering: DeviceRegistering
    ) {
        self.dispatcher = dispatcher
        self.reachabilityHelper = reachabilityHelper
        self.persistentQueue = persistentQueue
        self.failureDebounceMilliseconds = Int(failureDebounceSeconds * 1000)
        self.deviceRegistering = deviceRegistering
        startLoop()
    }

    private func startLoop() {
        DispatchQueue.main.async {
            self.loopIsRunning = true
            let nextItemResult = self.persistentQueue.next
            switch nextItemResult {
            case .success(let frontOfQueue):
                self.loopStep(queueItem: frontOfQueue)
            case .failure:
                self.loopIsRunning = false
            }
        }
    }

    private func loopStep(queueItem: PeristentQueueItem) {
        let delayTimeForFailure: DispatchTime = .now() + .milliseconds(failureDebounceMilliseconds)
        guard
            reachabilityHelper.hasNetworkConnection,
            deviceRegistering.sdkReady
        else {
            DispatchQueue.main.asyncAfter(deadline: delayTimeForFailure) {
                queueItem.releaseQueue(.doNothing)
                self.startLoop()
            }
            return
        }
        dispatcher.logEvent(queueItem.item.analyticEvent) { result in
            queueItem.item.analyticCompletion?(result)
            switch result {
            case .success(let success):
                queueItem.releaseQueue(.removeFirst)
                guard success else {
                    DispatchQueue.main.asyncAfter(deadline: delayTimeForFailure) {
                        self.startLoop()
                    }
                    return
                }
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

    public func logEvent(_ event: AnalyticEvent, completion: @escaping EventLoggedCompletion) {
        let eventAndCompletion = AnalyticEventAndCompletion(
            analyticEvent: event,
            analyticCompletion: completion)
        persistentQueue.addToQueue(eventAndCompletion)
        if !loopIsRunning { startLoop() }
    }
}

protocol AnalyticsEventProtocol {
    var name: String { get }
    var metadata: [String: Any] { get }
}

protocol AnalyticsEngine {
    func setProperties(with properties: [String: String])
    func log(event: AnalyticsEventProtocol)
}

extension AnalyticEvent: AnalyticsEventProtocol {
    var name: String { self.action }
    var metadata: [String: Any] { self.new ?? [:] }
}

struct RealifeTechAnalyticsEngine: AnalyticsEngine {

    let analytics: AnalyticsLogger

    func setProperties(with properties: [String: String]) { }

    func log(event: AnalyticsEventProtocol) {
        guard let event = event as? AnalyticEvent else { return }
        analytics.logEvent(event) { _ in }
    }
}
