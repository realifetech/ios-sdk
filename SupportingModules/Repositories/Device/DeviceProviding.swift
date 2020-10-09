//
//  DeviceProviding.swift
//  CLArena
//
//  Created by Ross Patman on 09/09/2019.
//  Copyright © 2019 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift

struct DevicePushConsentResponse: Codable {
    var items: [GranularPushConsent]
}

protocol DeviceProviding {
    var current: Observable<Device> { get }
    var granularPushConsents: Observable<[GranularPushConsent]> { get }
    var selectedEvent: Observable<Event> { get }
}
