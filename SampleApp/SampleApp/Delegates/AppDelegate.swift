//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI
import RealifeTech

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let configuration = SDKConfiguration(
            appCode: "LS",
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C",
            apiUrl: "http://api-staging.livestyled.com/v3",
            graphQLApiUrlString: "https://staging-graphql-eu.realifetech.com/",
            webOrderingJourneyUrl: nil)
        RealifeTech.configureSDK(with: configuration)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, error in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        RealifeTech.Communicate.registerForPushNotifications(tokenData: deviceToken) { result in
            switch result {
            case .success:
                print("---> [RealifeTech SDK] Communicate - Register for push notification successfully!")
            case .failure(let error):
                print("---> [RealifeTech SDK] Communicate - Register for push notification with error: \(error.localizedDescription)")
            }
        }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("---> [RealifeTech SDK] Communicate - Failed to register for remote notification: \(error.localizedDescription)")
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
