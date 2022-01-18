//
//  RLTDataModel.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol RLTDataModel: Decodable {
    var id: Int? { get }
    var language: String? { get }
    static func create(json: [String: Any?]?) -> RLTDataModel?
}

public extension RLTDataModel {
    static func create(json: [String: Any?]?) -> RLTDataModel? {
        guard let json = json,
              let data = try? JSONSerialization.data(withJSONObject: json, options: []) else { return nil }
        return try? JSONDecoder().decode(self, from: data)
    }
}
