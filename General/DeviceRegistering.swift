//
//  DeviceRegistering.swift
//  General
//
//  Created by Realife Tech on 25/09/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public protocol DeviceRegistering {
    var sdkReady: Bool { get }
    var deviceId: String { get }

    func registerDevice(_: @escaping(Result<Void, Error>) -> Void)
}
