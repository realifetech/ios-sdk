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
    func registerDevice(_: Device, _: @escaping(Result<Void, Error>) -> Void)
}

class DeviceRegistrationWorker: DeviceRegistrationWorkerProtocol {

    private let debounceRateSeconds: Int
    private let reachabilityChecker: ReachabilityChecking
    private let queue: DispatchQueue
    private let semaphore = DispatchSemaphore(value: 1)
    private let disposeBag: DisposeBag
    private let scheduler: ImmediateSchedulerType
    private let deviceProvider: DeviceProviding.Type

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
            device: device,
            retryThresholdSeconds: debounceRateSeconds)
        debouncedObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.semaphore.signal()
                completion(.success(()))
            }, onError: { _ in
                self.deviceRegistrationLoop(device, completion)
            })
            .disposed(by: disposeBag)
    }

    func makeDebouncedDeviceRegistrationObservable(device: Device, retryThresholdSeconds: Int = 10) -> Observable<Bool> {
        let tenSecondInterval = Observable<Int>
            .interval(.seconds(retryThresholdSeconds), scheduler: MainScheduler.instance)
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
