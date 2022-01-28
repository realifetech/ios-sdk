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
    public var userId: String?

    public var timestampString: String { timestamp.rltFormatted }

    /* If you would like to send a number with a decimal point, such as 6.6,
        to `new` or `old` we recommend that you use Decimal(6.6) */
    public init(
        type: String,
        action: String,
        new: [String: Any]? = nil,
        old: [String: Any]? = nil,
        version: String,
        timestamp: Date = Date()
    ) {
        self.type = type
        self.action = action
        self.new = Self.escape(new)
        self.old = Self.escape(old)
        self.version = version
        self.timestamp = timestamp
        self.userId = nil   // should be auto-inserted
    }

    private static func escape(_ dictionary: [String: Any]?) -> String? {
        guard let dictionary = dictionary,
              let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension AnalyticEvent: Equatable { }
