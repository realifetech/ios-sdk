//
//  EventLoggingViewController.swift
//  DummyProject
//
//  Created by Olivier Butler on 05/11/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import UIKit
import RealifeTech

class EventLoggingViewController: UIViewController {

    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var actionField: UITextField!
    @IBOutlet weak var key1Field: UITextField!
    @IBOutlet weak var key2Field: UITextField!
    @IBOutlet weak var value1Field: UITextField!
    @IBOutlet weak var value2Field: UITextField!

    @IBAction func logEventTapped(_ sender: Any) {
        RealifeTech.Analytics.logEvent(makeEvent()) { result in
            switch result {
            case .success(let didLog):
                self.presentDismissableMessageAlert(title: "Finished logging an event", message: didLog ? "We received true" : "We received false")
            case .failure(let error):
                self.presentDismissableMessageAlert(title: "Error logging event", message: error.localizedDescription)
            }
        }
    }

    private func makeEvent() -> AnalyticEvent {
        var dict: [String: String] = [:]
        if let key1 = key1Field.text, let value1 = value1Field.text {
            dict[key1] = value1
        }
        if let key2 = key2Field.text, let value2 = value2Field.text {
            dict[key2] = value2
        }
        return AnalyticEvent(
            type: typeField.text ?? "",
            action: actionField.text ?? "",
            new: dict,
            old: nil,
            version: "1.0")
    }
}
