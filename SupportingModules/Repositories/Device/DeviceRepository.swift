//
//  DeviceRepository.swift
//  CLArena
//
//  Created by apple on 25/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift

public struct DeviceRepository: RemoteDiskCacheDataProviding {

    public typealias Cdble = StandardV3SenderResponse
    public typealias Rqstr = DeviceRequester
}

extension DeviceRepository {

    public struct TokenRegistrationResponse: Codable {
        let snsEndpoint: String?
    }

    public static func registerDevice(_ device: Device) -> Observable<Bool> {
        return retrieve(
            type: StandardV3SenderResponse.self,
            forRequest: Rqstr.register(device: device),
            strategy: .remoteWithoutCachingResponse).map { $0.isSuccess }
    }

    public static func registerForPushNotifications(with deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return retrieve(
            type: TokenRegistrationResponse.self,
            forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken),
            strategy: .remoteWithoutCachingResponse)
    }
}
