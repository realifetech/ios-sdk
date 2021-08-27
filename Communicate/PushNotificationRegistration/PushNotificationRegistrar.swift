//
//  PushNotificationRegistrar.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

class PushNotificationRegistrar {

    private let disposeBag = DisposeBag()
    private let subscriptionScheduler: SchedulerType
    private let observationScheduler: SchedulerType
    private let tokenStore: Storeable
    private let deviceRepository: DeviceProviding.Type
    private let tokenKey: String = "APNToken"

    public init(
        subscriptionScheduler: SchedulerType? = nil,
        observationScheduler: SchedulerType? = nil,
        tokenStore: Storeable,
        deviceRepository: DeviceProviding.Type
    ) {
        self.subscriptionScheduler = subscriptionScheduler ?? ConcurrentDispatchQueueScheduler(qos: .background)
        self.observationScheduler = observationScheduler ?? MainScheduler.instance
        self.tokenStore = tokenStore
        self.deviceRepository = deviceRepository
        checkAndSendStoredToken()
    }

    private func checkAndSendStoredToken() {
        guard let storedToken: String = try? tokenStore.fetch(for: tokenKey) else { return }
        registerPushNotification(token: storedToken) { _ in }
    }

    private func registerPushNotification(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        deviceRepository.registerForPushNotifications(with: .defaultDeviceToken(withProviderToken: token))
            .subscribe(on: subscriptionScheduler)
            .observe(on: observationScheduler)
            .subscribe(onNext: { [self] _ in
                tokenStore.delete(key: tokenKey)
                completion(.success(()))
            }, onError: { error in
                completion(.failure(error))
            })
            .disposed(by: disposeBag)
    }

    private func string(withDeviceToken deviceToken: Data) -> String {
        return deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    }
}

extension PushNotificationRegistrar: PushNotificationRegistering {

    public func registerForPushNotifications(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        try? tokenStore.save(token, for: tokenKey)
        registerPushNotification(token: token, completion: completion)
    }

    public func registerForPushNotifications(tokenData: Data, completion: @escaping(Result<Void, Error>) -> Void) {
        let token = string(withDeviceToken: tokenData)
        try? tokenStore.save(token, for: tokenKey)
        registerPushNotification(token: token, completion: completion)
    }
}
