//
//  NotificationRegistrationHelper.swift
//  SampleApp
//
//  Created by YOU-HSUAN YU on 2022/4/26.
//  Copyright © 2022 Realife Tech. All rights reserved.
//
 
import UIKit

final class NotificationRegistrationHelper {

    func registerForRemoteNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, error in
            if let error = error {
                print("D'oh: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}
