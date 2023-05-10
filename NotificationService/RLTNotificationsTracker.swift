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
            /// AVS-621: Before we introduce Keychain Sharing, NSE authentication credentials are stored in old Keychain. And when app configure SDK, app will migrate the old credentials to save to new Keychain(with access group Id).
            /// But the credentials from NSE should not be saved to new Keychain, we
            RealifeTech.configureSDK(with: sdkConfiguration, from: .notificationServiceExtension)
            RealifeTech.Communicate?.trackPush(event: .received, trackInfo: userInfo) { _ in
                contentHandler(bestAttemptContent)
            }
        }
    }
}
