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

    let disposeBag: DisposeBag
    let reachabilityChecker: ReachabilityChecking
    let queue: DispatchQueue
    let semaphore = DispatchSemaphore(value: 1)
    //let registrationStatusWatcher: RegistrationStatusWatchable

    init(reachabilityChecker: ReachabilityChecking) {
        self.disposeBag = DisposeBag()
        self.reachabilityChecker = reachabilityChecker
        self.queue = DispatchQueue(
            label: "Revice registration queue",
            qos: .background)
    }

    func registerDevice(_ device: Device, _ completion: @escaping (Result<Void, Error>) -> Void) {
        queue.async {
            self.semaphore.wait()
            self.innerRegisterDevice(device, completion)
        }
    }

    func innerRegisterDevice(_ device: Device, _ completion: @escaping (Result<Void, Error>) -> Void) {
        guard reachabilityChecker.hasNetworkConnection else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
                self.innerRegisterDevice(device, completion)
            }
            return
        }
        let tenSecondInterval = Observable<Int>.interval(.seconds(10), scheduler: MainScheduler.instance)
            .take(1)
        let allDeviceRegistrationEvents = DeviceRepository
            .registerDevice(device)
            .materialize()
            .share(replay: 1)
        let deviceRegistrationErrors = allDeviceRegistrationEvents.compactMap { $0.error }
        let deviceRegistrationSuccess = allDeviceRegistrationEvents.compactMap { $0.element }
        Observable.zip(tenSecondInterval, deviceRegistrationErrors)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.innerRegisterDevice(device, completion)
            })
            .disposed(by: disposeBag)
        deviceRegistrationSuccess
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.semaphore.signal()
                completion(.success(()))
            })
            .disposed(by: disposeBag)
    }
}
