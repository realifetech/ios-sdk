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

    @IBOutlet weak var isAudienceMemberLabel: UILabel!
    @IBOutlet weak var deviceIdTextField: UITextField!
    @IBOutlet weak var audienceIdTextField: UITextField!

    @IBAction func buttonTapped(_ sender: Any) {
        let audienceId = audienceIdTextField.text ?? ""
        RealifeTech.Audiences.deviceIsMemberOfAudience(audienceId: audienceId) { result in
            switch result {
            case .success(let isMemberOfAudiences):
                let text = "Is Member of AudienceId"
                self.isAudienceMemberLabel.text = text + "\(audienceId): \(isMemberOfAudiences ? "True" : "false")"
            case .failure(let error):
                print(error)
            }
        }
    }
}
