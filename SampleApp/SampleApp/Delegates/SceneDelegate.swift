//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI
import RealifeTech

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let userInfo = connectionOptions.notificationResponse?.notification.request.content.userInfo as? [String: Any] {
            RealifeTech.Communicate?.trackPush(event: .opened, trackInfo: userInfo) { _ in }
        }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ModulesView())
        self.window = window
        window.makeKeyAndVisible()
    }
}
