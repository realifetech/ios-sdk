//
//  DeviceConsent.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/4/12.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum LocationGranularStatus: String, Codable {
    case always
    case appInUse
}

public struct DeviceConsent: Codable {

    public let calendar: Bool
    public let camera: Bool
    public let locationCapture: Bool
    public let locationGranular: LocationGranularStatus?
    public let photoSharing: Bool
    public let pushNotification: Bool

    public init(
        calendar: Bool,
        camera: Bool,
        locationCapture: Bool,
        locationGranular: LocationGranularStatus? = nil,
        photoSharing: Bool,
        pushNotification: Bool
    ) {
        self.calendar = calendar
        self.camera = camera
        self.locationCapture = locationCapture
        self.locationGranular = locationGranular
        self.photoSharing = photoSharing
        self.pushNotification = pushNotification
    }
}
