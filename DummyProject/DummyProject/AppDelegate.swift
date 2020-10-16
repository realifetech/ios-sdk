//
//  AppDelegate.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import RealifeTech
import Logging
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = SDKConfiguration(appCode: "hello",
                                             clientSecret: "no-one",
                                             graphApiUrl: "https://graphql-mock.realifetech.com/graphql")
        RealifeTech.configureSDK(with: configuration)
        RealifeTech.General.registerDevice { _ in }
        let event = LoggingEvent(type: "user",
                                 action: "externalLogin",
                                 new: ["userId": "a3890e983e", "provider": "ticketmaster"],
                                 old: nil, version: "1.0")
        RealifeTech.Analytics.logEvent(event) { error in
            print(error)
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
