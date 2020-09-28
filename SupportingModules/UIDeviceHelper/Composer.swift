//
//  Composer.swift
//  UIDeviceHelper
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct Composer {

    func makeUIDeviceHelper() -> UIDeviceInterface {
        return UIDeviceWrapper()
    }
}
