//
//  DeviceRepository.swift
//  CLArena
//
//  Created by apple on 25/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import Combine

public protocol DeviceProviding {

    static func registerDevice(_ device: Device) -> AnyPublisher<Bool, Error>

    static func registerForPushNotifications(
        with deviceToken: DeviceToken
    ) -> AnyPublisher<TokenRegistrationResponse, Error>
}

public struct DeviceRepository: RemoteDiskCacheDataProviding {

    public typealias Cdble = StandardV3SenderResponse
    public typealias Rqstr = DeviceRequester
}

extension DeviceRepository: DeviceProviding {

    public static func registerDevice(_ device: Device) -> AnyPublisher<Bool, Error> {
        return retrieve(
            type: StandardV3SenderResponse.self,
            forRequest: Rqstr.register(device: device),
            strategy: .remoteWithoutCachingResponse
        )
            .map { $0.isSuccess }
            .eraseToAnyPublisher()
    }

    public static func registerForPushNotifications(
        with deviceToken: DeviceToken
    ) -> AnyPublisher<TokenRegistrationResponse, Error> {
        return retrieve(
            type: TokenRegistrationResponse.self,
            forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken),
            strategy: .remoteWithoutCachingResponse)
    }
}
