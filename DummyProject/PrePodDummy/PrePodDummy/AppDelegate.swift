//
//  AppDelegate.swift
//  PrePodDummy
//
//  Created by Olivier Butler on 29/10/2020.
//

import UIKit
import RealifeTech

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        let configuration = SDKConfiguration(
            appCode: "LS",
            clientSecret: "$2y$10$O7HK3Afr1PZH3WTiQ7bTg.kfcle88e/n9GqrcCp7qWH8Rvv.Ojl/C")
        RealifeTech.configureSDK(with: configuration)
        RealifeTech.General.registerDevice {
            print("I registered")
        }
        return true
    }
}
