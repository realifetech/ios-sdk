//
//  AnalyticsEventAndCompletion.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public typealias EventLoggedCompletion = (Result<Void, Error>) -> Void

struct AnalyticsEventAndCompletion: Identifiable {
    let uniqueId: UUID = UUID()
    let analyticsEvent: AnalyticsEvent
    let analyticsCompletion: EventLoggedCompletion?
}

extension AnalyticsEventAndCompletion: Equatable {
    static func == (lhs: AnalyticsEventAndCompletion, rhs: AnalyticsEventAndCompletion) -> Bool {
        return lhs.analyticsEvent == rhs.analyticsEvent
    }
}

extension AnalyticsEventAndCompletion: Encodable {
    enum CodingKeys: String, CodingKey {
        case analyticsEvent
    }
}

extension AnalyticsEventAndCompletion: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        analyticsEvent = try values.decode(AnalyticsEvent.self, forKey: .analyticsEvent)
        analyticsCompletion = nil
    }
}
