//
//  CustomisationPOCViewController.swift
//  DummyProject
//
//  Created by Olivier Butler on 11/05/2021.
//  Copyright © 2021 Olivier Butler. All rights reserved.
//

import UIKit
import RealifeTech

class CustomisationPOCViewController: UIViewController {

    static func makeInstance() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: .main)
            .instantiateViewController(withIdentifier: "CustomisationPOCViewController")
    }

    override func viewDidLoad() {
        let view = RealifeTech.CustomisationPOC.makeSomeView(frame: self.view.frame)
        self.view.addSubview(view)
    }
}
