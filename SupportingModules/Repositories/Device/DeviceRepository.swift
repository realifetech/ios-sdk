//
//  DeviceRepository.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift
import APIV3Utilities
import APILayer

struct DeviceRepository: RemoteDiskCacheDataProviding {
    typealias Cdble = Device
    typealias Rqstr = DeviceRequester
}

extension DeviceRepository: DeviceProviding {
    var current: Observable<Device> {
        return DeviceRepository.retrieve(type: Cdble.self, forRequest: Rqstr.current, privateObj: false, strategy: .localOrRemoteIfExpired)
    }

    var granularPushConsents: Observable<[GranularPushConsent]> {
        return DeviceRepository.retrieve(type: DevicePushConsentResponse.self, forRequest: Rqstr.getGranularPushConsents(), strategy: .remote).map { return $0.items }
    }

    var selectedEvent: Observable<Event> {
        return DeviceRepository.retrieve(type: Event.self, forRequest: Rqstr.selectedEvent, strategy: .localAndForcedRemote)
    }
}
