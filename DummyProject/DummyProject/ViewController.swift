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
        super.viewDidLoad()
        let event = AnalyticsEvent(type: "user",
                                   action: "externalLogin",
                                   new: ["userId": "a3890e983e", "provider": "ticketmaster"],
                                   old: nil,
                                   version: "1.0",
                                   timestamp: Date())
        RealifeTech.Analytics.logEvent(event) { result in
            switch result {
            case .success:
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
