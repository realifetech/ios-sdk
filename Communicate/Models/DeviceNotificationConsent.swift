//
//  DeviceNotificationConsent.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/4/7.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public struct DeviceNotificationConsent {
    public let id: String
    public let enabled: Bool
    public let consent: NotificationConsent
}
