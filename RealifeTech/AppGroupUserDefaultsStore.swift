//
//  AppGroupUserDefaultsStore.swift
//  RealifeTech-SDK
//
//  Created by YOU-HSUAN YU on 2022/6/27.
//

import Foundation

class AppGroupUserDefaultsStore {

    private let appGroupStore: CodableStore
    private let configurationKey = "SDKConfiguration"

    init(appGroupId: String) {
        let storage = UserDefaultsStorage(userDefaults: UserDefaults(suiteName: appGroupId) ?? .standard)
        let store = CodableStore(storage: storage, storagePrefix: "NotificationExtension")
        self.appGroupStore = store
    }

    func saveSDKConfiguration(with configuration: SDKConfiguration) {
        try? appGroupStore.save(configuration, for: configurationKey)
    }

    func fetchSDKConfiguration() -> SDKConfiguration? {
        return try? appGroupStore.fetch(for: configurationKey)
    }
}
