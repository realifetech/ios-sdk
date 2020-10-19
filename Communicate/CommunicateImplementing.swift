//
//  CommunicateImplementing.swift
//  Communicate
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public final class CommunicateImplementing: PushNotificationRegistering {

    private let disposeBag = DisposeBag()
    private let scheduler: ImmediateSchedulerType

    public init(scheduler: ImmediateSchedulerType? = nil) {
        self.scheduler = scheduler ?? ConcurrentDispatchQueueScheduler(qos: .background)
    }

    public func registerForPushNotifications(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        DeviceRepository.registerForPushNotifications(with: .defaultDeviceToken(withProviderToken: token))
            .subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                completion(.success(()))
            }, onError: { error in
                // TODO: Store token and repeatedly try to send
                completion(.failure(error))
            })
            .disposed(by: disposeBag)
    }

    public func registerForPushNotifications(token: Data, completion: @escaping(Result<Void, Error>) -> Void) {
        guard let token = string(withDeviceToken: token) else {
            return completion(.failure(CommunicateError.invalidTokenData))
        }
        registerForPushNotifications(token: token, completion: completion)
    }

    private func string(withDeviceToken deviceToken: Data) -> String? {
        return deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    }
}

enum CommunicateError: Error {
    case invalidTokenData
}
