//
//  PushNotificationRegistering.swift
//  Communicate
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol PushNotificationRegistering {
    func registerForPushNotifications(token: String, completion: @escaping(Result<Void, Error>) -> Void)
    func registerForPushNotifications(token: Data, completion: @escaping(Result<Void, Error>) -> Void)
}
