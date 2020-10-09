//
//  DeviceSender.swift
//  CLArena
//
//  Created by apple on 25/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import APIV3Utilities
import RxSwift

struct DeviceSender: RemoteDiskCacheDataProviding {
    typealias Cdble = StandardV3SenderResponse
    typealias Rqstr = DeviceRequester

	enum DeviceUpdateKeys: String {
		case deviceConsent // ⤵
		case pushNotification, locationCapture, camera, photoSharing, calendar, locationGranular
	}
}

extension DeviceSender {
    static func register(device: Device) -> Observable<Bool> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.register(device: device), strategy: .remoteWithoutCachingResponse).map { $0.isSuccess }
    }

    struct TokenRegistrationResponse: Codable {
        let snsEndpoint: String?
    }

    static func register(tokenForPushNotificationsWithDeviceToken deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return retrieve(type: TokenRegistrationResponse.self, forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken), strategy: .remoteWithoutCachingResponse)
    }

    static func update(deviceCapabilityConsents consents: [String: Any]) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.post(deviceCapabilityConsents: consents), strategy: .remoteWithoutCachingResponse)
    }

    static func update(devicePushNotificationConsents consents: [String: Any]) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.post(devicePushNotificationConsents: consents), strategy: .remoteWithoutCachingResponse)
    }

    static func updateSelectedEvent(withId id: Int?) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.updateSelectedEvent(withId: id), strategy: .remote)
    }
}
