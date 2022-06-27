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

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        os_log("[DEBUG] ---NotificationService didReceive", log: .default, type: .error)
        let store = AppGroupUserDefaultsStore(appGroupId: "group.com.concertlive.SampleApp")
        RLTNotificationServiceConfigurator(appGroupStore: store).didReceive(request, withContentHandler: contentHandler)

//        if let bestAttemptContent = bestAttemptContent,
//           let userInfo = bestAttemptContent.userInfo as? [String: Any] {
//            configurator.fetchAppSecretAndConfigureSDK {
//                RealifeTech.Communicate.trackPush(event: .received, trackInfo: userInfo) { _ in
//                    contentHandler(bestAttemptContent)
//                }
//            }
//        }
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
