//
//  Device.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation

struct DeviceToken: Codable {

    enum Providers: String {
        case apple = "APPLE"
        case sns = "SNS"
    }
    let provider: String?
    let providerToken: String?

    static func defaultDeviceToken(withProviderToken providerToken: String) -> DeviceToken {
        return DeviceToken(provider: Providers.apple.rawValue, providerToken: providerToken)
    }
}

struct Device: Codable {
    let deviceTokens: [DeviceToken]?
    let token: String?
    let type: String?
    let model: String?
    let manufacturer: String?
    let appVersion: String?
    let osVersion: String?
    let bluetoothOn: Bool?
    let wifiConnected: Bool?
    let venueId: Int?
    let eventId: Int?
}

extension Device {
    var registeredSNSEndpoint: String? {
        guard let snsEndpoint = deviceTokens?.filter({ $0.provider == DeviceToken.Providers.sns.rawValue }).first, let endpoint = snsEndpoint.providerToken else { return nil }
        return endpoint
    }
}

extension Device {
    var jsonRepresentation: [String: Any] {
        guard let data = try? JSONEncoder().encode(self), let json = try? JSONSerialization.jsonObject(with: data, options: []), let jsonDict = json as? [String: Any] else { return [:] }
        return jsonDict
    }
}
