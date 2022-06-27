//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by YOU-HSUAN YU on 2022/6/21.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import UserNotifications
import RealifeTech
import os

class NotificationService: UNNotificationServiceExtension {

    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var bestAttemptContent: UNMutableNotificationContent?
    private let configurator = RLTNotificationServiceConfigurator(appGroupId: "group.com.concertlive.SampleApp")

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        os_log("[DEBUG] ---NotificationService didReceive", log: .default, type: .error)
        configurator.didReceive(request, withContentHandler: contentHandler)
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
