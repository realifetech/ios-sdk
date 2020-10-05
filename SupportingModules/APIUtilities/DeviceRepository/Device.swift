//
//  Device.swift
//  APIUtilities
//
//  Created by Olivier Butler on 03/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

struct Device: Codable {
    let token: String
    let type: String
    let appVersion: String
    let osVersion: String

    var jsonRepresentation: [String: Any] {
        guard let data = try? JSONEncoder().encode(self), let json = try? JSONSerialization.jsonObject(with: data, options: []), let jsonDict = json as? [String: Any] else { return [:] }
        return jsonDict
    }
}
