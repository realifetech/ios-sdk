//
//  Communicate.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol Communicate: PushNotificationRegistering {
    func trackPush(event: PushEvent, trackInfo: [String: Any], completion: @escaping(Result<Bool, Error>) -> Void)
}
