//
//  AnalyticsLogging.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public struct AnalyticsEvent: Codable {

    public let type: String
    public let action: String
    public let new: [String: String]?
    public let old: [String: String]?
    public let version: String

    public var newString: String? {
        return escape(new)
    }

    public var oldString: String? {
        escape(old)
    }

    public init(
        type: String,
        action: String,
        new: [String: String]? = nil,
        old: [String: String]? = nil,
        version: String
    ) {
        self.type = type
        self.action = action
        self.new = new
        self.old = old
        self.version = version
    }

    private func escape(_ dictionary: [String: String]?) -> String? {
        var escapedString: String?
        let encoder = JSONEncoder()
        guard
            dictionary != nil,
            let dictionaryString = try? encoder.encode(dictionary),
            let jsonString = String(data: dictionaryString, encoding: .utf8)
            else {
                return nil
        }
        escapedString = NSRegularExpression.escapedPattern(for: jsonString)
        return escapedString
    }
}

protocol AnalyticsLogging {
    func logEvent(_ event: AnalyticsEvent, completion: @escaping (_ error: Error?) -> Void
    )
}
