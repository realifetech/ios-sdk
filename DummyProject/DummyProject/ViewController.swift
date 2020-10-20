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

    override func viewDidLoad() {
        deviceIdLabel.text = RealifeTech.General.deviceId
    }

    @IBOutlet weak var deviceIdLabel: UILabel!

    @IBAction func registerDeviceTapped(_ sender: Any) {
        RealifeTech.General.registerDevice {}
    }

}
