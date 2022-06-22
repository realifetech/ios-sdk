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

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
//            RealifeTech.Communicate().trackPush(event: .received, trackInfo: bestAttemptContent.userInfo) {
//              completionHandler()
//            }
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
