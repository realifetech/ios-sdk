//
//  PushNotificationRegistrar.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

enum PushNotificationError: Error {
    case invalidTokenData
}

class PushNotificationRegistrar {

    private let disposeBag = DisposeBag()
    private let scheduler: ImmediateSchedulerType
    private let tokenStore: CodableStore
    private let tokenKey: String = "APNToken"

    public init(scheduler: ImmediateSchedulerType? = nil, tokenStore: CodableStore) {
        self.scheduler = scheduler ?? ConcurrentDispatchQueueScheduler(qos: .background)
        self.tokenStore = tokenStore
        checkAndSendStoredToken()
    }

    private func checkAndSendStoredToken() {
        guard let storedToken: String = try? tokenStore.fetch(for: tokenKey) else { return }
        registerPushNotification(token: storedToken) { _ in }
    }

    private func registerPushNotification(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        DeviceRepository.registerForPushNotifications(with: .defaultDeviceToken(withProviderToken: token))
            .subscribe(on: scheduler)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.tokenStore.delete(key: self.tokenKey)
                completion(.success(()))
            }, onError: { error in
                completion(.failure(error))
            })
            .disposed(by: disposeBag)
    }

    private func string(withDeviceToken deviceToken: Data) -> String? {
        return deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    }
}

extension PushNotificationRegistrar: PushNotificationRegistering {

    public func registerForPushNotifications(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        try? tokenStore.save(token, for: tokenKey)
        registerPushNotification(token: token, completion: completion)
    }

    public func registerForPushNotifications(tokenData: Data, completion: @escaping(Result<Void, Error>) -> Void) {
        guard let token = string(withDeviceToken: tokenData) else {
            return completion(.failure(PushNotificationError.invalidTokenData))
        }
        try? tokenStore.save(token, for: tokenKey)
        registerPushNotification(token: token, completion: completion)
    }
}
