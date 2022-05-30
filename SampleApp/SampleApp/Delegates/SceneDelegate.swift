//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI
import os

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        os_log("[DEBUG] ----2connectionOptions", log: .default, type: .error)
        if let response = connectionOptions.notificationResponse {
            print(response.notification.request.content.userInfo)
            os_log("[DEBUG] ----2connectionOptions notificationResponse", log: .default, type: .error)
       }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = UIViewController()
        vc.view.backgroundColor = .gray
        window.rootViewController = vc
//        window.rootViewController = UIHostingController(rootView: ModulesView())
        self.window = window
        window.makeKeyAndVisible()
    }
}
