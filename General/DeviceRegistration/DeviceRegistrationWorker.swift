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
import RealifeTech_CoreSDK

class DeviceRegistrationWorker: DeviceRegistering {

    var sdkReady: Bool {
        deviceRegisteredSubject.value
    }
    var deviceId: String { staticDeviceInformation.deviceId }

    private let staticDeviceInformation: StaticDeviceInformation
    private let reachabilityChecker: ReachabilityChecking
    private let deviceProvider: DeviceProviding.Type
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
            sdkVersion: "SDK_" + staticDeviceInformation.sdkVersion,
            osVersion: staticDeviceInformation.osVersion,
            bluetoothOn: reachabilityChecker.isBluetoothConnected,
            wifiConnected: reachabilityChecker.isConnectedToWifi)
    }

    init(
        staticDeviceInformation: StaticDeviceInformation,
        reachabilityChecker: ReachabilityChecking,
        deviceProvider: DeviceProviding.Type = DeviceRepository.self,
        deviceRegistrationMaxAttempts: Int = .max,
        retryRegistrationInterval: Double = 10,
        store: Storeable,
        subscriptionScheduler: SchedulerType = SerialDispatchQueueScheduler(
            internalSerialQueueName: "Device registration queue"),
        observationScheduler: SchedulerType = MainScheduler.instance
    ) {
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
        return (try? store.fetch(for: storeKey)) ?? false
    }

    func registerDevice(_ completion: @escaping () -> Void) {
        deviceProvider.registerDevice(device)
            .subscribeOn(subscriptionScheduler)
            .observeOn(observationScheduler)
            .retryWhen { [self] errors in
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
                deviceRegisteredSubject.send(value)
                completion()
            }, onError: { [self] _ in
                deviceRegisteredSubject.send(false)
                completion()
            })
            .disposed(by: bag)
    }
}
