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
    let uniqueId: UUID
    let analyticsEvent: AnalyticsEvent
    let analyticsCompletion: EventLoggedCompletion?

    public init(analyticsEvent: AnalyticsEvent, analyticsCompletion: EventLoggedCompletion?) {
        self.analyticsEvent = analyticsEvent
        self.analyticsCompletion = analyticsCompletion
        self.uniqueId = UUID()
    }
}

extension AnalyticsEventAndCompletion: Equatable {
    static func == (lhs: AnalyticsEventAndCompletion, rhs: AnalyticsEventAndCompletion) -> Bool {
        return lhs.analyticsEvent == rhs.analyticsEvent && lhs.uniqueId == rhs.uniqueId
    }
}

extension AnalyticsEventAndCompletion: Encodable {
    enum CodingKeys: String, CodingKey {
        case analyticsEvent, uniqueId
    }
}

extension AnalyticsEventAndCompletion: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        analyticsEvent = try values.decode(AnalyticsEvent.self, forKey: .analyticsEvent)
        uniqueId = try values.decode(UUID.self, forKey: .uniqueId)
        analyticsCompletion = nil
    }
}
