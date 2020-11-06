//
//  UIViewController+Extensions.swift
//  DummyProject
//
//  Created by Olivier Butler on 05/11/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDismissableMessageAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(.init(title: "O.K.", style: .default, handler: { _ in self.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
