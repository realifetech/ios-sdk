//
//  SDKConfigurable.swift
//  General
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol SDKConfigurable {
    func setConfiguration(_: SDKConfiguration)
}

public protocol SDKConfiguration {
    var appCode: String { get }
    var clientSecret: String { get }
    var apiUrl: String? { get }
    var graphApiUrl: String? { get }
}
