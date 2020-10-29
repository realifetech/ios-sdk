//
//  ViewController.swift
//  PrePodDummy
//
//  Created by Olivier Butler on 29/10/2020.
//

import UIKit
import RealifeTech

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RealifeTech.General.registerDevice {
            RealifeTech.Communicate.registerForPushNotifications(
                token: "BAD",
                completion: self.handleResultT)
        }
    }

    func handleResultT(_ result: Result<Void, Error>) {
        switch result {
        case .success:
            print("Thank you for registering your device for push")
        case .failure(let error):
            print("We failed to register for push", error)
        }
    }
}
