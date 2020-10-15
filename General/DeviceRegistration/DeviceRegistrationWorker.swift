//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Repositories
import ReachabilityChecker
import RxSwift
import RxCocoa

protocol DeviceRegistrationWorkerProtocol {
    var hasRegistered: Bool { get }
    func registerDevice(_: Device, _: @escaping(Result<Void, Error>) -> Void)
}

/// Handles device registration calls.
/// Requests will repeat until network connection & success received.
/// When registering multiple times, requests are queued.
class DeviceRegistrationWorker: DeviceRegistrationWorkerProtocol {

    var hasRegistered: Bool = false

    private let debounceRateSeconds: Int
    private let reachabilityChecker: ReachabilityChecking
    private let queue: DispatchQueue
    private let semaphore = DispatchSemaphore(value: 1)
    private let disposeBag: DisposeBag
    private let scheduler: ImmediateSchedulerType
    private let deviceProvider: DeviceProviding.Type

    /// - Parameter reachabilityChecker: Used to check if we have network connectivity
    /// - Parameter debounceRateSeconds: How long to enforce between retry attempts.
    /// - Parameter scheduler: [Optional] Which sheduler to use for Rx subsciptions
    /// - Parameter deviceProvider: [Optional] The repositiory which provides a device registration observable
    init(
        reachabilityChecker: ReachabilityChecking,
        debounceRateSeconds: Int,
        scheduler: ImmediateSchedulerType? = nil,
        deviceProvider: DeviceProviding.Type = DeviceRepository.self
    ) {
        self.debounceRateSeconds = debounceRateSeconds
        self.disposeBag = DisposeBag()
        self.reachabilityChecker = reachabilityChecker
        self.queue = DispatchQueue(
            label: "Revice registration queue",
            qos: .background)
        self.scheduler = scheduler ?? ConcurrentDispatchQueueScheduler(qos: .background)
        self.deviceProvider = deviceProvider
    }

    /// Will register a device with the backend.
    /// Calls will repeat when they fail. Device registration calls will queued.
    func registerDevice(_ device: Device, _ completion: @escaping (Result<Void, Error>) -> Void) {
        queue.async {
            self.semaphore.wait()
            self.deviceRegistrationLoop(device, completion)
        }
    }

    /// Begins a loop to register the device, checks connectivity before attempting, and will retry on failure.
    func deviceRegistrationLoop(
        _ device: Device,
        _ completion: @escaping (Result<Void, Error>) -> Void
    ) {
        guard reachabilityChecker.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(debounceRateSeconds)) {
                self.deviceRegistrationLoop(device, completion)
            }
            return
        }
        let debouncedObservable = makeDebouncedDeviceRegistrationObservable(
            device: device)
        debouncedObservable
            .subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.semaphore.signal()
                self?.hasRegistered = true
                completion(.success(()))
            }, onError: { [weak self] _ in
                self?.deviceRegistrationLoop(device, completion)
            })
            .disposed(by: disposeBag)
    }

    func makeDebouncedDeviceRegistrationObservable(device: Device) -> Observable<Bool> {
        let tenSecondInterval = Observable<Int>
            .interval(.seconds(debounceRateSeconds), scheduler: MainScheduler.instance)
            .take(1)
        let allDeviceRegistrationEvents = deviceProvider
            .registerDevice(device)
            .materialize()
            .share(replay: 1)
        let deviceRegistrationErrors = allDeviceRegistrationEvents
            .compactMap { $0.error }
        let successObservable: Observable<Bool> = allDeviceRegistrationEvents
            .compactMap { $0.element }
        let retryObservable: Observable<Bool> = Observable.zip(tenSecondInterval, deviceRegistrationErrors)
            .map { (_, error) in throw error }
        return Observable.merge(successObservable, retryObservable)
    }
}
