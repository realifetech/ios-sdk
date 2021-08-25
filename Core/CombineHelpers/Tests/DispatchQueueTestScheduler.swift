//
//  DispatchQueueTestScheduler.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 23/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Combine
@testable import RealifeTech

final class DispatchQueueTestScheduler: Scheduler {

    typealias SchedulerTimeType = DispatchQueue.SchedulerTimeType
    typealias SchedulerOptions = DispatchQueue.SchedulerOptions

    // Scheduler needs to be advanced before execution for delayed actions with interval
    var enableImmediateExecutionIfPossible = true
    var now: DispatchQueue.SchedulerTimeType
    var minimumTolerance: DispatchQueue.SchedulerTimeType.Stride
    var immediateActions: [ImmediateAction] = []
    var delayedActions: [DelayedAction] = []
    var delayedIntervalActions: [DelayedIntervalAction] = []

    init() {
        now = .init(.now())
        minimumTolerance = .zero
    }

    func advance(by interval: DispatchQueue.SchedulerTimeType.Stride) {
        now = now.advanced(by: interval)
    }

    func schedule(options: DispatchQueue.SchedulerOptions?, _ action: @escaping () -> Void) {
        immediateActions.append(ImmediateAction(options: options, action: action))
        if enableImmediateExecutionIfPossible {
            action()
        }
    }

    func schedule(
        after: SchedulerTimeType,
        tolerance: SchedulerTimeType.Stride,
        options: SchedulerOptions?,
        _ action: @escaping () -> Void
    ) {
        let delayedAction = DelayedAction(
            after: after,
            tolerance: tolerance,
            options: options,
            action: action
        )
        delayedActions.append(delayedAction)
        if enableImmediateExecutionIfPossible {
            action()
        }
    }

    func schedule(
        after: SchedulerTimeType,
        interval: SchedulerTimeType.Stride,
        tolerance: SchedulerTimeType.Stride,
        options: SchedulerOptions?,
        _ action: @escaping () -> Void
    ) -> Cancellable {
        let delayedIntervalAction = DelayedIntervalAction(
            after: after,
            interval: interval,
            tolerance: tolerance,
            options: options,
            action: action
        )
        delayedIntervalActions.append(delayedIntervalAction)
        return AnyCancellable { [weak self] in
            self?.delayedIntervalActions.removeAll(where: { $0.uuid == delayedIntervalAction.uuid })
        }
    }
}

extension DispatchQueueTestScheduler {

    struct ImmediateAction {
        let uuid = UUID()
        let options: DispatchQueue.SchedulerOptions?
        let action: () -> Void
    }

    struct DelayedAction {
        let uuid = UUID()
        let after: SchedulerTimeType
        let tolerance: SchedulerTimeType.Stride
        let options: SchedulerOptions?
        let action: () -> Void
    }

    struct DelayedIntervalAction {
        let uuid = UUID()
        let after: SchedulerTimeType
        let interval: SchedulerTimeType.Stride
        let tolerance: SchedulerTimeType.Stride
        let options: SchedulerOptions?
        let action: () -> Void
    }
}

extension AnyScheduler where S: DispatchQueue {

    static var test: AnyScheduler<DispatchQueue> {
        DispatchQueueTestScheduler().eraseToAnyScheduler()
    }
}
