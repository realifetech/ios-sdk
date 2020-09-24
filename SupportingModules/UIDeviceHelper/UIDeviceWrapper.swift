//
//  UIDeviceWrapper.swift
//  UIDeviceHelper
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import UIKit

public struct UIDeviceWrapper {}

extension UIDeviceWrapper: UIDeviceInterface {

    /// Returns a string created from the UUID, such as “E621E1F8-C36C-495A-93FC-0C247A3E6E5F”
    public var id: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }

    /// The model of the device.
    /// - Possible examples of model strings are @”iPhone” and @”iPod touch”.
    public var model: String {
        return UIDevice.current.model
    }

    /// The current version of the operating system.
    /// - An example of the system version is @”1.2”.
    public var osVersion: String {
        return UIDevice.current.systemVersion
    }
}
