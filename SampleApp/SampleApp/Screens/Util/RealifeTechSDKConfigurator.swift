//
//  RealifeTechSDKConfigurator.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/6/22.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
import RealifeTech

class RealifeTechSDKConfigurator {

    private let appGroupStore: UserDefaults?
    private let appCodeKey = "appCode"
    private let clientSecretKey = "clientSecret"

    init(appGroupStore: UserDefaults? = UserDefaults(suiteName: "group.com.concertlive.SampleApp")) {
        self.appGroupStore = appGroupStore
    }

    func fetchAppSecretAndConfigureSDK(completion: @escaping () -> Void) {
        guard let appGroupStore = appGroupStore,
              let appCode = appGroupStore.value(forKey: appCodeKey) as? String,
              let clientSecret = appGroupStore.value(forKey: clientSecretKey) as? String else {
            return completion()
        }
        configureSDKAndRegisterDevice(appCode: appCode, clientSecret: clientSecret, completion: completion)
    }

    func configureSDKAndRegisterDevice(appCode: String, clientSecret: String, completion: @escaping () -> Void) {
        let configuration = SDKConfiguration(
                    appCode: appCode,
                    clientSecret: clientSecret,
                    apiUrl: "https://api-staging.livestyled.com/v3",
                    graphQLApiUrl: "https://staging-graphql-eu.realifetech.com",
                    webOrderingJourneyUrl: nil)
        RealifeTech.configureSDK(with: configuration)
        RealifeTech.General.registerDevice(completion)
    }

    func saveAppSecret(appCode: String, clientSecret: String) {
        appGroupStore?.set(appCode, forKey: appCodeKey)
        appGroupStore?.set(clientSecret, forKey: clientSecretKey)
        appGroupStore?.synchronize()
    }
}

