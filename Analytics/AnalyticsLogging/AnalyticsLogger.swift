//
//  AnalyticsLogger.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

class AnalyticsLogger {

    typealias PeristentQueueItem = QueueItem<AnalyticEventAndCompletion>

    private let failureDebounceMilliseconds: Int
    private let graphQLManager: GraphQLManageable
    private let persistentQueue: AnyQueue<AnalyticEventAndCompletion>
    private let reachabilityHelper: ReachabilityChecking
    private let deviceRegistering: DeviceRegistering
    private let identityPersister: IdentityPersisting

    private var attempts = 0
    private let maxAttempts: Int
    private var loopIsRunning = false

    public init(
        graphQLManager: GraphQLManageable,
        reachabilityHelper: ReachabilityChecking,
        persistentQueue: AnyQueue<AnalyticEventAndCompletion>,
        failureDebounceSeconds: Double = 45,
        deviceRegistering: DeviceRegistering,
        identityPersister: IdentityPersisting,
        maxAttempts: Int = 2
    ) {
        self.graphQLManager = graphQLManager
        self.reachabilityHelper = reachabilityHelper
        self.persistentQueue = persistentQueue
        self.failureDebounceMilliseconds = Int(failureDebounceSeconds * 1000)
        self.deviceRegistering = deviceRegistering
        self.identityPersister = identityPersister
        self.maxAttempts = maxAttempts
        startLoop()
    }

    private func startLoop() {
        DispatchQueue.main.async { [self] in
            loopIsRunning = true
            let nextItemResult = persistentQueue.next
            switch nextItemResult {
            case .success(let frontOfQueue):
                loopStep(queueItem: frontOfQueue)
            case .failure:
                loopIsRunning = false
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
        performPutAnalyticEventMutation(event: queueItem.item.analyticEvent) { result in
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

    private func performPutAnalyticEventMutation(
        event: AnalyticEvent,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        let input = ApolloType.AnalyticEvent(
            type: event.type,
            action: event.action,
            new: event.new,
            old: event.old,
            version: event.version,
            timestamp: event.timestampString,
            userId: event.userId)
        graphQLManager.dispatchMutation(
            mutation: ApolloType.PutAnalyticEventMutation(input: input),
            cacheResultToPersistence: false
        ) { result in
            switch result {
            case .success(let success):
                completion(.success(success.data?.putAnalyticEvent.success ?? false))
            case .failure(let error):
                self.attemptToRetryWhenFailed(
                    with: error,
                    event: event,
                    completion: completion)
            }
        }
    }

    private func attemptToRetryWhenFailed(
        with error: Error,
        event: AnalyticEvent,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        if attempts < maxAttempts {
            attempts += 1
            performPutAnalyticEventMutation(event: event, completion: completion)
        } else {
            completion(.failure(error))
        }
    }
}

extension AnalyticsLogger: AnalyticsLogging {

    public func track(_ event: AnalyticEvent, completion: @escaping EventLoggedCompletion) {
        var eventToPersist = event
        if let userId = identityPersister.retrieveUserId() {
            eventToPersist.userId = userId
        }
        let eventAndCompletion = AnalyticEventAndCompletion(
            analyticEvent: eventToPersist,
            analyticCompletion: completion)
        persistentQueue.addToQueue(eventAndCompletion)
        if !loopIsRunning { startLoop() }
    }
}
