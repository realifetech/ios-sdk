//
//  CommunicateImplementing.swift
//  Communicate
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public final class CommunicateImplementing {

    let pushNotificationRegistrar: PushNotificationRegistering

    init(pushNotificationRegistrar: PushNotificationRegistering) {
        self.pushNotificationRegistrar = pushNotificationRegistrar
    }
}

extension CommunicateImplementing: PushNotificationRegistering {

    public func registerForPushNotifications(token: String, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(token: token, completion: completion)
    }

    public func registerForPushNotifications(token: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(token: token, completion: completion)
    }
}
