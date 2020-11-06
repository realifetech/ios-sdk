//
//  PushNotificationViewController.swift
//  DummyProject
//
//  Created by Olivier Butler on 05/11/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import UIKit
import RealifeTech

class PushNotificationViewController: UIViewController {

    @IBOutlet weak var apnTokenField: UITextField!

    override func viewDidLoad() {
        apnTokenField.delegate = self
        super.viewDidLoad()
    }

    @IBAction func didTapRegisterForPush(_ sender: Any) {
        RealifeTech.Communicate.registerForPushNotifications(token: apnTokenField.text ?? "") { result in
            switch result {
            case .success:
                self.presentDismissableMessageAlert(title: "Token has been registered!", message: "")
            case .failure(let error):
                self.presentDismissableMessageAlert(title: "Error registering token", message: error.localizedDescription)
            }
        }
    }
}
