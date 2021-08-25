//
//  AnyScheduler.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import Combine

final class AnyScheduler<S: Scheduler>: AnySchedulerBase<S.SchedulerTimeType, S.SchedulerOptions> { }

typealias DispatchQueueAnyScheduler = AnyScheduler<DispatchQueue>

class AnySchedulerBase<Time: Strideable, Options>: Scheduler where Time.Stride: SchedulerTimeIntervalConvertible {

    typealias SchedulerTimeType = Time
    typealias SchedulerOptions = Options

    var now: Time { _now() }
    var minimumTolerance: Time.Stride { _minimumTolerance() }

    private let _now: () -> Time
    private let _minimumTolerance: () -> Time.Stride
    private let _schedule: (
        _ options: Options?,
        _ action: @escaping () -> Void) -> Void
    private let _scheduleAfter: (
        _ date: Time,
        _ tolerance: Time.Stride,
        _ options: SchedulerOptions?,
        _ action: @escaping () -> Void) -> Void
    private let _scheduleAfterCancellable: (
        _ date: SchedulerTimeType,
        _ interval: SchedulerTimeType.Stride,
        _ tolerance: SchedulerTimeType.Stride,
        _ options: SchedulerOptions?,
        _ action: @escaping () -> Void) -> Cancellable

    init<S: Scheduler>(scheduler: S) where S.SchedulerTimeType == Time, S.SchedulerOptions == Options {
        _now = { scheduler.now }
        _minimumTolerance = { scheduler.minimumTolerance }
        _schedule = { options, action in
            scheduler.schedule(options: options, action)
        }
        _scheduleAfter = { date, tolerance, options, action in
            scheduler.schedule(
                after: date,
                tolerance: tolerance,
                options: options,
                action)
        }
        _scheduleAfterCancellable = { date, interval, tolerance, options, action in
            scheduler.schedule(
                after: date,
                interval: interval,
                tolerance: tolerance,
                options: options,
                action)
        }
    }

    func schedule(options: Options?, _ action: @escaping () -> Void) {
        _schedule(options, action)
    }

    func schedule(
        after date: Time,
        tolerance: Time.Stride,
        options: Options?,
        _ action: @escaping () -> Void
    ) {
        _scheduleAfter(date, tolerance, options, action)
    }

    func schedule(
        after date: Time,
        interval: Time.Stride,
        tolerance: Time.Stride,
        options: Options?, _ action: @escaping () -> Void
    ) -> Cancellable {
        _scheduleAfterCancellable(date, interval, tolerance, options, action)
    }
}

extension Scheduler {

    func eraseToAnyScheduler<S: Scheduler>() -> AnyScheduler<S>
    where S.SchedulerOptions == SchedulerOptions, S.SchedulerTimeType == SchedulerTimeType {
        AnyScheduler(scheduler: self)
    }
}

extension AnyScheduler where S: DispatchQueue {

    static var main: AnyScheduler<DispatchQueue> {
        DispatchQueue.main.eraseToAnyScheduler()
    }

    static func global(qos: DispatchQoS.QoSClass = .default) -> AnyScheduler<DispatchQueue> {
        DispatchQueue.global(qos: qos).eraseToAnyScheduler()
    }
}
