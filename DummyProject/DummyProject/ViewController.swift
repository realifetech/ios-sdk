//
//  ViewController.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import RealifeTech
import RealifeTech_CoreSDK

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // Analytics
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var actionTextField: UITextField!
    // Audience
    @IBOutlet weak var audienceIdTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        typeTextField.text = "user"
        actionTextField.text = "externalLogin"
    }

    @IBAction func deviceRegistrationButtonTapped(_ sender: Any) {
        updateLoadingSpinnerVisibility(shouldShow: true)
        RealifeTech.General.registerDevice { [self] in
            showAlertController(title: "Device Registration", message: "Result: \(RealifeTech.General.sdkReady)")
        }
    }

    @IBAction func logEventButtonTapped(_ sender: Any) {
        guard RealifeTech.General.sdkReady else {
            showAlertController(
                title: "SDK is not ready yet",
                message: "Please tap Device Registration button to register device")
            return
        }
        updateLoadingSpinnerVisibility(shouldShow: true)
        let event = AnalyticEvent(
            type: typeTextField.text ?? "user",
            action: actionTextField.text ?? "externalLogin",
            new: ["userId": "a3890e983e", "provider": "ticketmaster"],
            old: nil,
            version: "1.0",
            timestamp: Date())
        RealifeTech.Analytics.logEvent(event) { [self] result in
            switch result {
            case .success(let isLogged):
                showAlertController(
                    title: "Analytics - Log Event",
                    message: "Success with result isLogged: \(isLogged)")
            case .failure(let error):
                showAlertController(
                    title: "Analytics - Log Event",
                    message: "Error with: \(error.localizedDescription)")
            }
        }
    }

    @IBAction func checkAudienceButtonTapped(_ sender: Any) {
        guard RealifeTech.General.sdkReady else {
            showAlertController(
                title: "SDK is not ready yet",
                message: "Please tap Device Registration button to register device")
            return
        }
        updateLoadingSpinnerVisibility(shouldShow: true)
        RealifeTech.Audiences.deviceIsMemberOfAudience(audienceId: audienceIdTextField.text ?? "") { [self] result in
            switch result {
            case .success(let isMember):
                showAlertController(title: "Audience", message: "Success with result isMember: \(isMember)")
            case .failure(let error):
                showAlertController(title: "Audience", message: "Error with: \(error.localizedDescription)")
            }
        }
    }

    private func updateLoadingSpinnerVisibility(shouldShow: Bool) {
        shouldShow ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }

    func showAlertController(title: String?, message: String?) {
        updateLoadingSpinnerVisibility(shouldShow: false)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
