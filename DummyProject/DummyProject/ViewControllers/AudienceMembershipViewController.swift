//
//  AudienceMembershipViewController.swift
//  DummyProject
//
//  Created by Olivier Butler on 05/11/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import UIKit
import RealifeTech

class AudienceMembershipViewController: UIViewController {
    
    @IBOutlet weak var audienceIdField: UITextField!

    @IBAction func didTapAudienceQuery(_ sender: Any) {
        RealifeTech.Audiences.deviceIsMemberOfAudience(
            audienceId: audienceIdField.text ?? ""
        ) { result in
            switch result {
            case .success(let isMember):
                self.presentDismissableMessageAlert(title: "Audience query answer", message: isMember ? "We are a member of the audience" : "We are not a memeber of the audience")
            case .failure(let error):
                self.presentDismissableMessageAlert(title: "Error with audience query", message: error.localizedDescription)
            }
        }
    }
}
