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
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        NotificationRegistrationHelper().registerForRemoteNotification()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        RealifeTech.Communicate?.registerForPushNotifications(tokenData: deviceToken) { result in
            switch result {
            case .success:
                print("---> [RealifeTech SDK]")
                print("Communicate - Register for push notification successfully!")
            case .failure(let error):
                print("---> [RealifeTech SDK]")
                print("Communicate - Register for push notification with error: \(error.localizedDescription)")
            }
        }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("---> [RealifeTech SDK]")
        print("Failed to register for remote notification: \(error.localizedDescription)")
    }

    // This function will be called when the app receive notification, only when app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // show the notification alert (banner), and with sound
        completionHandler([.alert, .sound])
    }

        // This function will be called right after user tap on the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        let userInfo = response.notification.request.content.userInfo
//        RealifeTech.Communicate().trackPush(event: .opened, trackInfo: userInfo) {
//            completionHandler()
//        }
        let application = UIApplication.shared

        if application.applicationState == .active {
        }

        if application.applicationState == .inactive {

        }
        completionHandler()
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
