//
//  RLTNotificationServiceConfigurator.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/6/27.
//

import Foundation
import os

public class RLTNotificationServiceConfigurator { // only for extension app usage

    private let appGroupStore: AppGroupUserDefaultsStore?

    public init(appGroupId: String) {
        self.appGroupStore = AppGroupUserDefaultsStore(appGroupId: appGroupId)
    }

    public func didReceive(_ request: UNNotificationRequest,
                           withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        if let bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent),
           let userInfo = bestAttemptContent.userInfo as? [String: Any] {
            os_log("[DEBUG] ---RLTNotificationServiceConfigurator didReceive", log: .default, type: .error)
            configureSDKAndRegisterDevice {
                RealifeTech.Communicate?.trackPush(event: .received, trackInfo: userInfo) { _ in
                    os_log("[DEBUG] ---RLTNotificationServiceConfigurator track received completed", log: .default, type: .error)
                    contentHandler(bestAttemptContent)
                }
            }
        }
    }

    private func configureSDKAndRegisterDevice(completion: @escaping () -> Void) {
        guard let sdkConfiguration = appGroupStore?.fetchSDKConfiguration() else {
            os_log("[DEBUG] ---configureSDKAndRegisterDevice nil", log: .default, type: .error)
            return completion()
        }
        os_log("[DEBUG] ---sdkConfiguration %{public}@", log: .default, type: .error, sdkConfiguration.appCode)
        RealifeTech.configureSDK(with: sdkConfiguration)
        RealifeTech.General.registerDevice(completion)
    }
}
