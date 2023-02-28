//
//  DeviceRepository.swift
//  CLArena
//
//  Created by apple on 25/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift
#if !COCOAPODS
import GraphQL
#endif

public protocol DeviceProviding {

    func registerDevice(_ device: Device) -> Observable<Bool>

    static func registerForPushNotifications(
        with deviceToken: DeviceToken
    ) -> Observable<TokenRegistrationResponse>
}

public class DeviceRepository: RemoteDiskCacheDataProviding {

    public typealias Cdble = StandardSenderResponse
    public typealias Rqstr = DeviceRequester

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }
}

extension DeviceRepository: DeviceProviding {

    public func registerDevice(_ device: Device) -> Observable<Bool> {
        let input = ApolloType.DeviceInput(
            token: device.token,
            type: device.type,
            status: nil,
            appVersion: device.appVersion,
            osVersion: device.osVersion,
            model: device.model,
            manufacturer: device.manufacturer,
            bluetoothOn: device.bluetoothOn,
            wifiConnected: device.wifiConnected,
            tokens: [])
        return Observable.create { observer in
            self.graphQLManager.dispatchMutation(
                mutation: ApolloType.SyncDeviceMutation(input: input),
                cacheResultToPersistence: false) { result in
                    switch result {
                    case .success(let response):
                        let acknowledged = response.data?.syncDevice?.acknowledged
                        observer.onNext(acknowledged ?? false)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }

    public static func registerForPushNotifications(
        with deviceToken: DeviceToken
    ) -> Observable<TokenRegistrationResponse> {
        return retrieve(
            type: TokenRegistrationResponse.self,
            forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken),
            strategy: .remoteWithoutCachingResponse)
    }
}
