//
//  PushNotificationRegistrar.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import Combine

enum PushNotificationError: Error {
    case invalidTokenData
}

class PushNotificationRegistrar {

    private var cancellable: Set<AnyCancellable> = .init()
    private let tokenStore: CodableStorage
    private let tokenKey: String = "APNToken"

    public init(tokenStore: CodableStorage) {
        self.tokenStore = tokenStore
        checkAndSendStoredToken()
    }

    private func checkAndSendStoredToken() {
        guard let storedToken: String = try? tokenStore.fetch(for: tokenKey) else { return }
        registerPushNotification(token: storedToken) { _ in }
    }

    private func registerPushNotification(token: String, completion: @escaping(Result<Void, Error>) -> Void) {
        DeviceRepository.registerForPushNotifications(with: .defaultDeviceToken(withProviderToken: token))
            .subscribe(on: DispatchQueue.global(qos: .background))
            .sink { endResult in
                switch endResult {
                case .finished: break
                case .failure(let error):
                    completion(.failure(error))
                }
            } receiveValue: { _ in
                self.tokenStore.delete(key: self.tokenKey)
                completion(.success(()))
            }
            .store(in: &cancellable)
// TODO: Why can't I specify the queue I receive on?
//            .receive(on: DispatchQueue.global)
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

    public func registerForPushNotifications(token: Data, completion: @escaping(Result<Void, Error>) -> Void) {
        guard let token = string(withDeviceToken: token) else {
            return completion(.failure(PushNotificationError.invalidTokenData))
        }
        try? tokenStore.save(token, for: tokenKey)
        registerPushNotification(token: token, completion: completion)
    }
}
