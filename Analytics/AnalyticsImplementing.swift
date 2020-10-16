//
//  AnalyticsImplementing.swift
//  Analytics
//
//  Created by Jonathon Albert on 13/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public class AnalyticsImplementing: AnalyticsLogging {

    let dispatcher: EventSending

    public init(dispatcher: EventSending) {
        self.dispatcher = dispatcher
    }

    func logEvent(_ event: AnalyticsEvent, completion: @escaping (Error?) -> Void) {
        dispatcher.logEvent()
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
