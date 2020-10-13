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
        let configuration = SDKConfiguration(appCode: "hello", clientSecret: "no-one")
        RealifeTech.configureSDK(with: configuration)
        RealifeTech.General.registerDevice { result in
            // TODO: Remove if approved
            print("Device Registration - ", result)
            RealifeTech.Communicate.registerForPushNotifications(token: UUID().uuidString) { result in
                print("Push notification registration call = ", result)
            }
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
