//
//  AnalyticEvent.swift
//  Analytics
//
//  Created by Jonathon Albert on 15/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct AnalyticEvent: Codable {

    public var storedName: String?
    public let type: String
    public let action: String
    public let new: String?
    public let old: String?
    public let version: String
    public let timestamp: Date

    public var timestampString: String { timestamp.rltFormatted }

    public init(
        type: String,
        action: String,
        new: [String: String]? = nil,
        old: [String: String]? = nil,
        version: String,
        timestamp: Date = Date()
    ) {
        self.type = type
        self.action = action
        self.new = Self.escape(new)
        self.old = Self.escape(old)
        self.version = version
        self.timestamp = timestamp
    }

    private static func escape(_ dictionary: [String: Any]?) -> String? {
        guard let dictionary = dictionary,
              let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else { return nil }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}

extension AnalyticEvent: Equatable { }
