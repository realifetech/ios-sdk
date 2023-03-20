//
//  RLTNotificationsTracker.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/6/27.
//

import UserNotifications

public class RLTNotificationsTracker {

    private let appGroupStore: AppGroupUserDefaultsStore?

    public init(appGroupId: String) {
        self.appGroupStore = AppGroupUserDefaultsStore(appGroupId: appGroupId)
    }

    public func didReceive(_ request: UNNotificationRequest,
                           withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        if let bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent),
           let userInfo = bestAttemptContent.userInfo as? [String: Any] {
            guard let sdkConfiguration = appGroupStore?.fetchSDKConfiguration() else {
                return contentHandler(bestAttemptContent)
            }
            RealifeTech.configureSDK(with: sdkConfiguration)
            RealifeTech.Communicate?.trackPush(event: .received, trackInfo: userInfo) { _ in
                contentHandler(bestAttemptContent)
            }
        }
    }
}
