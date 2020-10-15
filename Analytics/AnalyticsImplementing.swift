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

    let dispatcher: GraphQLDispatching

    public init(dispatcher: GraphQLDispatching) {
        self.dispatcher = dispatcher
    }

    public func logEvent(
        type: String,
        action: String,
        new: [String: String]?,
        old: [String: String]?,
        completion: @escaping (Error?) -> Void
    ) {
        let newData: String? = escape(new)
        let oldData: String? = escape(old)
        let event = AnalyticEvent(type: type, action: action, new: newData, old: oldData, version: "1.0")
        dispatcher.dispatchMutation(mutation: PutAnalyticEventMutation(input: event), completion: { result in
            switch result {
            case .success:
                return completion(nil)
            case .failure(let error):
                return completion(error)
            }
        })
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
