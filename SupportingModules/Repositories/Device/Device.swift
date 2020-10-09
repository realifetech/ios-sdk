//
//  Device.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation

public struct Device: Codable {
    let token: String? // Device ID
    let type: String?
    let model: String?
    let manufacturer: String?
    let appVersion: String?
    let osVersion: String?
    let bluetoothOn: Bool?
    let wifiConnected: Bool?

    public init(id: String, type: String = "IOS", model: String, manufacturer: String = "APPL", sdkVersion: String, osVersion: String, bluetoothOn: Bool, wifiConnected: Bool) {
        self.token = id
        self.type = type
        self.model = model
        self.manufacturer = manufacturer
        self.appVersion = sdkVersion
        self.osVersion = osVersion
        self.wifiConnected = wifiConnected
        self.bluetoothOn = bluetoothOn
    }
}

extension Device {
    var jsonRepresentation: [String: Any] {
        guard
            let data = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonDict = json as? [String: Any]
            else {
                return [:]
        }
        return jsonDict
    }
}
