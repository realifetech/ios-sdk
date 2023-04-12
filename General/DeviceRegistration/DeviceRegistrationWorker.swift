//
//  DeviceRegistrationWorker.swift
//  General
//
//  Created by Olivier Butler on 16/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine
import RxSwift

class DeviceRegistrationWorker: DeviceRegistering {

    var sdkReady: Bool {
        deviceRegisteredSubject.value
    }
    var deviceId: String { staticDeviceInformation.deviceId }

    private let appGroupStore: AppGroupUserDefaultsStore?
    private let staticDeviceInformation: StaticDeviceInformation
    private let reachabilityChecker: ReachabilityChecking
    private let deviceProvider: DeviceProviding
    private let deviceRegistrationMaxAttempts: Int
    private let retryRegistrationInterval: RxTimeInterval
    private let store: Storeable
    private let subscriptionScheduler: SchedulerType
    private let observationScheduler: SchedulerType
    private let deviceRegisteredSubject = CurrentValueSubject<Bool, Never>(false)
    private let storeKey = "DeviceRegistrationState"
    private let bag = DisposeBag()

    var device: Device {
        Device(
            deviceId: staticDeviceInformation.deviceId,
            model: staticDeviceInformation.deviceModel,
            appVersion: staticDeviceInformation.appVersion,
            osVersion: staticDeviceInformation.osVersion,
            bluetoothOn: reachabilityChecker.isBluetoothConnected,
            wifiConnected: reachabilityChecker.isConnectedToWifi)
    }

    init(
        appGroupStore: AppGroupUserDefaultsStore?,
        staticDeviceInformation: StaticDeviceInformation,
        reachabilityChecker: ReachabilityChecking,
        deviceProvider: DeviceProviding,
        deviceRegistrationMaxAttempts: Int = .max,
        retryRegistrationInterval: Double = 10,
        store: Storeable,
        subscriptionScheduler: SchedulerType = SerialDispatchQueueScheduler(
            internalSerialQueueName: "Device registration queue"),
        observationScheduler: SchedulerType = MainScheduler.instance
    ) {
        self.appGroupStore = appGroupStore
        self.staticDeviceInformation = staticDeviceInformation
        self.reachabilityChecker = reachabilityChecker
        self.deviceProvider = deviceProvider
        self.deviceRegistrationMaxAttempts = deviceRegistrationMaxAttempts
        self.retryRegistrationInterval = retryRegistrationInterval > 1 ?
            .seconds(Int(retryRegistrationInterval)) :
            .milliseconds(Int(retryRegistrationInterval * 1000))
        self.store = store
        self.subscriptionScheduler = subscriptionScheduler
        self.observationScheduler = observationScheduler
        deviceRegisteredSubject.send(getStoredRegistrationValue())
    }

    func getStoredRegistrationValue() -> Bool {
        return (try? store.fetch(for: storeKey)) ?? appGroupStore?.fetchSDKReady() ?? false
    }

    func registerDevice(_ completion: @escaping (Bool) -> Void) {
        deviceProvider.registerDevice(device)
            .subscribe(on: subscriptionScheduler)
            .observe(on: observationScheduler)
            .retry { [self] errors in
                return errors.enumerated().flatMap { (attempt, error) -> Observable<Int> in
                    return attempt < deviceRegistrationMaxAttempts ?
                        Observable<Int>
                        .timer(retryRegistrationInterval, scheduler: observationScheduler)
                        .take(1) :
                        .error(error)
                }
            }
            .subscribe(onNext: { [self] value in
                try? store.save(value, for: storeKey)
                appGroupStore?.saveSDKReady(value)
                deviceRegisteredSubject.send(value)
                completion(value)
            }, onError: { [self] _ in
                appGroupStore?.saveSDKReady(false)
                deviceRegisteredSubject.send(false)
                completion(false)
            })
            .disposed(by: bag)
    }

    func updateMyDeviceConsent(_ deviceConsent: DeviceConsent, completion: @escaping (Result<Bool, Error>) -> Void) {
        deviceProvider.updateMyDeviceConsent(deviceConsent)
            .subscribe(on: subscriptionScheduler)
            .observe(on: observationScheduler)
            .subscribe(onNext: { result in
                completion(.success(result))
            }, onError: { error in
                completion(.failure(error))
            })
            .disposed(by: bag)
    }
}
