//
//  UIDeviceInterface.swift
//  UIDeviceHelper
//
//  Created by Jonathon Albert on 24/09/2020.
//  Copyright © 2020 Olivier Butler. All rights reserved.
//

import Foundation

public protocol UIDeviceInterface {
    var id: String { get }
    var model: String { get }
    var osVersion: String { get }
}
