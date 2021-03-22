//
//  AnalyticEventAndCompletion.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public typealias EventLoggedCompletion = (Result<Bool, Error>) -> Void

struct AnalyticEventAndCompletion: Identifiable {

    let uniqueId: UUID
    let analyticEvent: AnalyticEvent
    let analyticCompletion: EventLoggedCompletion?

    public init(analyticEvent: AnalyticEvent, analyticCompletion: EventLoggedCompletion?) {
        self.analyticEvent = analyticEvent
        self.analyticCompletion = analyticCompletion
        self.uniqueId = UUID()
    }
}

extension AnalyticEventAndCompletion: Equatable {
    static func == (lhs: AnalyticEventAndCompletion, rhs: AnalyticEventAndCompletion) -> Bool {
        return lhs.analyticEvent == rhs.analyticEvent && lhs.uniqueId == rhs.uniqueId
    }
}

extension AnalyticEventAndCompletion: Encodable {
    enum CodingKeys: String, CodingKey {
        case analyticEvent, uniqueId
    }
}

extension AnalyticEventAndCompletion: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        analyticEvent = try values.decode(AnalyticEvent.self, forKey: .analyticEvent)
        uniqueId = try values.decode(UUID.self, forKey: .uniqueId)
        analyticCompletion = nil
    }
}
