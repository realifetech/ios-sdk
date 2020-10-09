//
//  DeviceMockRepository.swift
//  CLArena
//
//  Created by Ross Patman on 09/09/2019.
//  Copyright © 2019 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift

struct DeviceMockRepository: DeviceProviding {
    var current: Observable<Device> {
        return Observable.from(optional: Device(deviceTokens: [], token: nil, type: nil, model: nil, manufacturer: nil, appVersion: nil, osVersion: nil, bluetoothOn: nil, wifiConnected: nil, venueId: nil, eventId: nil))
    }

    var granularPushConsents: Observable<[GranularPushConsent]> {
        return Observable.from(optional: [])
    }

    var selectedEvent: Observable<Event> {
        return Observable.from(optional: EventMockRepository.event(with: VenueEventSelectorDataManager.selectedEventId ?? 0))
    }
}
