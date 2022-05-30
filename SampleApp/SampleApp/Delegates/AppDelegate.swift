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
import UserNotifications
import os

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let configuration = SDKConfiguration(
            appCode: "", //
            clientSecret: "", //
            apiUrl: "https://api-staging.livestyled.com/v3",
            graphQLApiUrl: "https://staging-graphql-eu.realifetech.com",
            webOrderingJourneyUrl: nil)
        RealifeTech.configureSDK(with: configuration)

        UNUserNotificationCenter.current().delegate = self

//        os_log("[DEBUG] ----Launching", log: .default, type: .error)
//
//        if let _ = launchOptions?[.remoteNotification] as? [String: AnyObject] {
//            os_log("[DEBUG] ----launchOptions remoteNotification", log: .default, type: .error)
//        } else {
//            os_log("[DEBUG] ----launchOptions nil", log: .default, type: .error)
//        }

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, error in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    os_log("[DEBUG] ----registerForRemoteNotifications", log: .default, type: .error)
                    application.registerForRemoteNotifications()
                }
            }
        }
        return true
    }
    // This function will be called when the app receive notification, only when app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        os_log("[DEBUG] ----UNUserNotificationCenter willPresent", log: .default, type: .error)
        // show the notification alert (banner), and with sound
        completionHandler([.alert, .sound])
      }

    // This function will be called right after user tap on the notification
      func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
          let userInfo = response.notification.request.content.userInfo
          let application = UIApplication.shared
            
            if(application.applicationState == .active){
                os_log("[DEBUG] ----UNUserNotificationCenter didReceive - open alert in active", log: .default, type: .error)
//              print("user tapped the notification bar when the app is in foreground")
              
            }
            
            if(application.applicationState == .inactive) {
                os_log("[DEBUG] ----UNUserNotificationCenter didReceive - open alert in background", log: .default, type: .error)
//              print("user tapped the notification bar when the app is in background")
            }
        // tell the app that we have finished processing the user’s action / response
        completionHandler()
      }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("-----didRegisterForRemoteNotificationsWithDeviceToken \(token)")
        os_log("[DEBUG] ----didRegisterForRemoteNotificationsWithDeviceToken %@", log: .default, type: .error, token)
        RealifeTech.Communicate.registerForPushNotifications(tokenData: deviceToken) { result in
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
        os_log("[DEBUG] ----didFailToRegisterForRemoteNotificationsWithError", log: .default, type: .error)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        os_log("[DEBUG] ----didReceiveRemoteNotification", log: .default, type: .error)
        completionHandler(.newData)
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {

        if let response = options.notificationResponse {
            print(response.notification.request.content.userInfo)
            os_log("[DEBUG] ----connectingSceneSession notificationResponse", log: .default, type: .error)
       }
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
