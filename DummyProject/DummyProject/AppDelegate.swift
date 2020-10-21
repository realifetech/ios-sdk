//
//  AppDelegate.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import RealifeTech
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = SDKConfiguration(
            appCode: "LS_0", // TODO: Append the _0
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C",
            apiUrl: "http://api-staging.livestyled.com/v3",
            graphApiUrl: "https://graphql-mock.realifetech.com/graphql")
        RealifeTech.configureSDK(with: configuration)
        RealifeTech.General.registerDevice {}
        let event = AnalyticsEvent(type: "user",
                                 action: "externalLogin",
                                 new: ["userId": "a3890e983e", "provider": "ticketmaster"],
                                 old: nil, version: "1.0")
        print("🌳 Going to add x3 new events to the queue [AppDelegate]")
        RealifeTech.Analytics.logEvent(event) { result in
            print("🌳 logging event callback 1 [AppDelegate]", result)
        }
        RealifeTech.Analytics.logEvent(event) { result in
            print("🌳 logging event callback 2 [AppDelegate]", result)
        }
        RealifeTech.Analytics.logEvent(event) { result in
            print("🌳 logging event callback 3 [AppDelegate]", result)
        }
        print(RealifeTech.General.sdkReady)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
