//
//  ViewController.swift
//  DummyProject
//
//  Created by Realife Tech on 23/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit
import RealifeTech
import CoreBluetooth

class SDKConfigurationViewController: UIViewController {

    @IBOutlet weak var appCode: UITextField!
    @IBOutlet weak var clientSecret: UITextField!
    @IBOutlet weak var apiUrl: UITextField!
    @IBOutlet weak var graphApiUrl: UITextField!

    var manager: CBCentralManager?

    override func viewDidLoad() {
        [appCode, clientSecret, apiUrl, graphApiUrl].forEach {
            $0?.delegate = self
        }
        super.viewDidLoad()
    }

    @IBAction func configureSDKTapped(_ sender: Any) {
        let apiUrlOptional: String? = apiUrl.text?.isEmpty ?? true ? nil : apiUrl.text
        let graphUrlOptional: String? = graphApiUrl.text?.isEmpty ?? true ? nil : graphApiUrl.text
        let configuration = SDKConfiguration(
            appCode: appCode.text ?? "",
            clientSecret: clientSecret.text ?? "",
            apiUrl: apiUrlOptional,
            graphApiUrl: graphUrlOptional)
        RealifeTech.configureSDK(with: configuration)
    }

    @IBAction func registerTapped(_ sender: Any) {
        RealifeTech.General.registerDevice {}
    }

    @IBAction func sdkReadyTapped(_ sender: Any) {
        self.presentDismissableMessageAlert(
            title: "SDK is Ready?",
            message: "\(RealifeTech.General.sdkReady)")
    }

    @IBAction func resetDevice(_ sender: Any) {
        clearAllData()
    }

    @IBAction func triggerBluetoothPermissions(_ sender: Any) {
        triggerBluetoothPermissionsDialogue()
    }
}

// MARK: - Bluetooth permissions
extension SDKConfigurationViewController: CBCentralManagerDelegate  {

    func triggerBluetoothPermissionsDialogue() {
        self.manager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("We got new bluetooth permissions, do we have access?", central.state == .poweredOn)
    }
}

// MARK: - Reset device
extension SDKConfigurationViewController {
    func clearAllData() {
        clearAllFile()
        clearUserDefaults()
        clearKeychain()
    }


    func clearAllFile() {
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            let fileName = try fileManager.contentsOfDirectory(atPath: paths)
            for file in fileName {
                let filePath = URL(fileURLWithPath: paths)
                    .appendingPathComponent(file)
                    .absoluteURL
                try fileManager.removeItem(at: filePath)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func clearUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }

    func clearKeychain() {
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
}
