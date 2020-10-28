//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

protocol DeviceRegistrationLoopHandling {
    func registerDevice(_: Device, _: @escaping() -> Void)
}

/// Sends and manages device registration calls.
/// Requests will repeat until network connection & success received.
/// When registering multiple times, requests are queued.
class DeviceRegistrationLoopHandler: DeviceRegistrationLoopHandling {

    private let debounceRateMilliseconds: Int
    private let reachabilityChecker: ReachabilityChecking
    private let queue: DispatchQueue
    private let semaphore = DispatchSemaphore(value: 1)
    //private let scheduler: ImmediateScheduler
    private let deviceProvider: DeviceProviding.Type
    private var cancellable: Set<AnyCancellable>

    /// - Parameter reachabilityChecker: Used to check if we have network connectivity
    /// - Parameter debounceRateSeconds: How long to enforce between retry attempts.
    /// - Parameter scheduler: [Optional] Which sheduler to use for Rx subsciptions
    /// - Parameter deviceProvider: [Optional] The repositiory which provides a device registration observable
    init(
        reachabilityChecker: ReachabilityChecking,
        debounceRateSeconds: Double,
        scheduler: ImmediateScheduler? = nil,
        deviceProvider: DeviceProviding.Type = DeviceRepository.self
    ) {
        self.debounceRateMilliseconds = Int(debounceRateSeconds * 1000)
        self.cancellable = .init()
        self.reachabilityChecker = reachabilityChecker
        self.queue = DispatchQueue(
            label: "Revice registration queue",
            qos: .background)
        self.deviceProvider = deviceProvider
    }

    /// Will register a device with the backend.
    /// Calls will repeat when they fail. Device registration calls will queued.
    func registerDevice(_ device: Device, _ completion: @escaping () -> Void) {
        queue.async {
            self.semaphore.wait()
            self.deviceRegistrationLoop(device, completion)
        }
    }

    /// Begins a loop to register the device, checks connectivity before attempting, and will retry on failure.
    private func deviceRegistrationLoop(
        _ device: Device,
        _ completion: @escaping () -> Void
    ) {
        guard reachabilityChecker.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(debounceRateMilliseconds)) {
                self.deviceRegistrationLoop(device, completion)
            }
            return
        }
        let debouncedObservable = makeDebouncedDeviceRegistrationObservable(
            device: device)
        debouncedObservable
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { endResult in
                switch endResult {
                case .finished: break
                case .failure:
                    self.deviceRegistrationLoop(device, completion)
                }
            } receiveValue: { _ in
                self.semaphore.signal()
                completion()
            }
            .store(in: &cancellable)
    }

    private func makeDebouncedDeviceRegistrationObservable(device: Device) -> AnyPublisher<Bool, Error> {
        let interval = PassthroughSubject<Void, Never>()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(debounceRateMilliseconds)) {
            interval.send(())
        }
        let allDeviceRegistrationEvents = deviceProvider
            .registerDevice(device)
            .share()
        let deviceRegistrationErrors: AnyPublisher<Error, Never> = allDeviceRegistrationEvents
            .compactMap { (success) -> Error? in
                return nil
            }
            .catch { (error) -> AnyPublisher<Error, Never> in
                Just(error).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        let successObservable: AnyPublisher<Bool, Error> = allDeviceRegistrationEvents
            .catch { _ in Empty<Bool, Never>() }
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        let retryObservable: AnyPublisher<Bool, Error> = interval
            .zip(deviceRegistrationErrors)
            .setFailureType(to: Error.self)
            .flatMap { (_, errorWrapper) -> AnyPublisher<Bool, Error> in
                return Fail<Bool, Error>(error: errorWrapper).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        return successObservable
            .merge(with: retryObservable)
            .eraseToAnyPublisher()
    }
}
// TANO (Tanoo / Tanough)
// ROYDEN

struct ErrorWrapper: Error {
    let error: Error
}
