//
//  CommunicateImplementing.swift
//  Communicate
//
//  Created by Olivier Butler on 12/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import RxSwift

public final class CommunicateImplementing: Communicate {

    let pushNotificationRegistrar: PushNotificationRegistering
    let analytics: Analytics

    init(pushNotificationRegistrar: PushNotificationRegistering, analytics: Analytics) {
        self.pushNotificationRegistrar = pushNotificationRegistrar
        self.analytics = analytics
    }

    public func trackPush(
        event: PushEvent,
        trackInfo: [String: Any],
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        let new = extractTrackInfo(with: trackInfo)
        let event = AnalyticEvent(type: "user", action: event.rawValue, new: new, old: nil, version: "1.0")
        analytics.track(event, completion: completion)
    }

    private func extractTrackInfo(with trackInfo: [String: Any]) -> [String: Any]? {
        guard let custom = trackInfo["custom"] as? [String: Any], let track = custom["track"] as? [String: Any] else {
            return nil
        }
        return track
    }
}

extension CommunicateImplementing: PushNotificationRegistering {

    public func registerForPushNotifications(token: String, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(token: token, completion: completion)
    }

    public func registerForPushNotifications(tokenData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        pushNotificationRegistrar.registerForPushNotifications(tokenData: tokenData, completion: completion)
    }
}
