//
//  DeviceRepository.swift
//  APIUtilities
//
//  Created by Olivier Butler on 03/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

struct DeviceRepository: RemoteDiskCacheDataProviding {
    typealias Cdble = StandardV3SenderResponse
    typealias Rqstr = DeviceRequester
}

extension DeviceRepository {
    static func register(device: Device) -> Observable<Bool> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.register(device: device), strategy: .remoteWithoutCachingResponse).map { $0.isSuccess }
    }

    struct TokenRegistrationResponse: Codable {
        let snsEndpoint: String?
    }

    static func register(tokenForPushNotificationsWithDeviceToken deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return retrieve(type: TokenRegistrationResponse.self, forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken), strategy: .remoteWithoutCachingResponse)
    }
}
