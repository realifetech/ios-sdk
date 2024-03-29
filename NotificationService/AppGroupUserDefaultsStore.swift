//
//  AppGroupUserDefaultsStore.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/6/27.
//

import Foundation

enum AppGroupStoreKey: String {
    case prefix = "NotificationExtension"
    case configurationKey = "SDKConfiguration"
    case sdkReadyKey = "SDKReady"
}

class AppGroupUserDefaultsStore {

    private let appGroupStore: CodableStore
    private let configurationKey = AppGroupStoreKey.configurationKey.rawValue
    private let sdkReadyKey = AppGroupStoreKey.sdkReadyKey.rawValue

    init?(appGroupId: String) {
        guard let appGroupUserDefaults = UserDefaults(suiteName: appGroupId) else {
            return nil
        }
        let store = CodableStore(
            storage: UserDefaultsStorage(userDefaults: appGroupUserDefaults),
            storagePrefix: AppGroupStoreKey.prefix.rawValue)
        self.appGroupStore = store
    }

    func saveSDKConfiguration(with configuration: SDKConfiguration) {
        try? appGroupStore.save(configuration, for: configurationKey)
    }

    func fetchSDKConfiguration() -> SDKConfiguration? {
        try? appGroupStore.fetch(for: configurationKey)
    }

    func saveSDKReady(_ sdkReady: Bool) {
        try? appGroupStore.save(sdkReady, for: sdkReadyKey)
    }

    func fetchSDKReady() -> Bool? {
        try? appGroupStore.fetch(for: sdkReadyKey)
    }
}
