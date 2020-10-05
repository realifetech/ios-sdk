//
//  DeviceToken.swift
//  APIUtilities
//
//  Created by Olivier Butler on 03/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

struct DeviceToken: Codable {
    let provider: String?
    let providerToken: String?
}
