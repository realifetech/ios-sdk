//
//  ViewController.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import RealifeTech

class ViewController: UIViewController {

    @IBOutlet weak var tokenField: UITextField!

    @IBAction func registerForPush(_ sender: Any) {
        guard let token = tokenField.text else {
            return
        }
        RealifeTech.Communicate.registerForPushNotifications(token: token) { _ in }
    }
}
