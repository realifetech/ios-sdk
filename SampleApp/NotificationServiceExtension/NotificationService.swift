//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by YOU-HSUAN YU on 2022/6/21.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import UserNotifications
import RealifeTech

class NotificationService: UNNotificationServiceExtension {

    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var bestAttemptContent: UNMutableNotificationContent?
    private let configurator = RealifeTechSDKConfigurator()

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        if let bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent),
           let userInfo = bestAttemptContent.userInfo as? [String: Any] {
            configurator.fetchAppSecretAndConfigureSDK {
                RealifeTech.Communicate.trackPush(event: .received, trackInfo: userInfo) { _ in
                    contentHandler(bestAttemptContent)
                }
            }
        }
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
