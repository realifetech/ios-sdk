//
//  AppDelegate.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import RealifeTech

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let configuration = CoreConfiguration(
            appCode: "",
            clientSecret: "",
            apiUrl: "",
            graphQLApiUrl: "")
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
            guard let rootViewController = UIApplication.shared.windows.first(
                    where: { $0.isKeyWindow })?.rootViewController as? ViewController
            else { return }
            switch result {
            case .success:
                rootViewController.showAlertController(
                    title: "Communicate",
                    message: "Register for push notification successfully")
            case .failure(let error):
                rootViewController.showAlertController(
                    title: "Communicate",
                    message: "Register for push notification with error: \(error.localizedDescription)")
            }
        }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        guard let rootViewController = UIApplication.shared.windows.first(
                where: { $0.isKeyWindow })?.rootViewController as? ViewController
        else { return }
        rootViewController.showAlertController(
            title: "Communicate",
            message: "Failed to register for remote notifications: \(error.localizedDescription)")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
