//
//  UIDeviceFactory.swift
//  UIDeviceHelper
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import UIKit

public struct UIDeviceFactory {

    public static func makeUIDeviceHelper(device: UIDevice = UIDevice.current, deviceId: String?) -> UIDeviceInterface {
        return UIDeviceWrapper(device: device, id: deviceId)
    }
}
