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

    override func viewDidLoad() {
        super.viewDidLoad()
        typeTextField.text = "user"
        actionTextField.text = "externalLogin"
        pickerView.dataSource = self
        pickerView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - General (Device Registration)

    @IBAction func deviceRegistrationButtonTapped(_ sender: Any) {
        updateLoadingSpinnerVisibility(shouldShow: true)
        RealifeTech.General.registerDevice { [self] in
            showAlertController(title: "Device Registration", message: "Result: \(RealifeTech.General.sdkReady)")
        }
    }

    // MARK: - Analytics (Log Event)

    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var actionTextField: UITextField!

    @IBAction func logEventButtonTapped(_ sender: Any) {
        checkIfSDKIsReady()
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

    // MARK: - Audience

    @IBOutlet weak var audienceIdTextField: UITextField!

    @IBAction func checkAudienceButtonTapped(_ sender: Any) {
        checkIfSDKIsReady()
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

    // MARK: - Content (WebPage)

    @IBOutlet weak var contentTextField: UITextField!
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        contentTextField.inputView = pickerView
        return pickerView
    }()

    @IBAction func getWebPageButtonTapped(_ sender: Any) {
        guard let pageType = WebPageType(value: contentTextField.text ?? "") else {
            showAlertController(
                title: "Content - Invalid Page Type",
                message: "Unable to find this page type")
            return
        }
        updateLoadingSpinnerVisibility(shouldShow: true)
        RealifeTech.Content.getWebPage(forType: pageType) { [self] result in
            switch result {
            case .success(let webPage):
                showAlertController(
                    title: "Content",
                    message: "Web Page for type: \(pageType.rawValue) with URL: \(webPage.url)")
            case .failure(let error):
                showAlertController(
                    title: "Content",
                    message: "Get web page failure due to error: \(error.localizedDescription)")
            }
        }
    }

    @IBAction func modalWebPageViewButtonTapped(_ sender: Any) {
        guard let pageType = WebPageType(value: contentTextField.text ?? "") else {
            showAlertController(
                title: "Content - Invalid Page Type",
                message: "Unable to find this page type")
            return
        }
        updateLoadingSpinnerVisibility(shouldShow: true)
        RealifeTech.Content.createWebPageView(
            forType: pageType,
            webPgaeViewControllerDelegate: self) { [weak self] viewController in
            self?.updateLoadingSpinnerVisibility(shouldShow: false)
            self?.present(viewController, animated: true, completion: nil)
        }
    }

    // MARK: - Helper methods

    private func checkIfSDKIsReady() {
        guard !RealifeTech.General.sdkReady else { return }
        showAlertController(
            title: "SDK is not ready yet",
            message: "Please tap Device Registration button to register device")
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

    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UITextField delegate

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        closeKeyboard()
        return true
    }
}

// MARK: - UIPickerView dataSource & delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WebPageType.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WebPageType.allCases[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        contentTextField.text = WebPageType.allCases[row].rawValue
    }
}

// MARK: - WebPageViewController delegate

extension ViewController: WebPageViewControllerDelegate {

    func webViewCanGoBack() {
        print("webViewCanGoBack")
    }

    func webViewCanGoForward() {
        print("webViewCanGoForward")
    }

    func webViewEstimatedProgressChanged(_ progress: Double) {
        print("webViewEstimatedProgressChanged: \(progress)")
    }

    func urlForNavigationAction(_ url: URL?) {
        guard let url = url else { return }
        print("urlForNavigationAction: \(url)")
    }

    func webViewDidStartProvisionalNavigation() {
        print("webViewDidStartProvisionalNavigation")
    }

    func webViewDidFinishNavigation() {
        print("webViewDidFinishNavigation")
    }
}
