//
//  UIDeviceWrapper.swift
//  UIDeviceHelper
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit

public struct UIDeviceWrapper {
    let id: String?
    let device: UIDevice

    /// - Parameters:
    ///   - device: UIDevice.current
    ///   - id: The deviceId from SDKConfiguration
    init(device: UIDevice = UIDevice.current, id: String?) {
        self.device = device
        self.id = id
    }
}

extension UIDeviceWrapper: UIDeviceInterface {

    /// If deviceId from SDKConfiguration is nil, returns a device IDFV string from Apple, such as “E621E1F8-C36C-495A-93FC-0C247A3E6E5F”
    public var deviceId: String {
        return id ?? device.identifierForVendor?.uuidString ?? ""
    }

    /// The model of the device.
    /// - Possible examples of model strings are @”iPhone” and @”iPod touch”.
    public var model: String {
        return device.model
    }

    /// The current version of the operating system.
    /// - An example of the system version is @”1.2”.
    public var osVersion: String {
        return device.systemVersion
    }
}
