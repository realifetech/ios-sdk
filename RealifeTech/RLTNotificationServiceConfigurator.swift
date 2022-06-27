//
//  RLTNotificationServiceConfigurator.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/6/27.
//

import Foundation
import os

public class AppGroupUserDefaultsStore {

    private let appGroupStore: CodableStore
    private let configurationKey = "SDKConfiguration"

    public init(appGroupId: String) {
        let storage = UserDefaultsStorage(userDefaults: UserDefaults(suiteName: appGroupId) ?? .standard)
        let store = CodableStore(storage: storage, storagePrefix: "NotificationExtension")
        self.appGroupStore = store
    }

    public func saveSDKConfiguration(with configuration: SDKConfiguration) {
        os_log("[DEBUG] ---saveSDKConfiguration", log: .default, type: .error)
        try? appGroupStore.save(configuration, for: configurationKey)
    }

    public func fetchSDKConfiguration() -> SDKConfiguration? {
        os_log("[DEBUG] ---saveSDKConfiguration", log: .default, type: .error)
        return try? appGroupStore.fetch(for: configurationKey)
    }
}

public class RLTNotificationServiceConfigurator { // only for extension app usage

    private let appGroupStore: AppGroupUserDefaultsStore?

    // TODO: refactor
    public init(appGroupStore: AppGroupUserDefaultsStore = AppGroupUserDefaultsStore(appGroupId: "group.com.concertlive.SampleApp")) {
        self.appGroupStore = appGroupStore
        
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
