//
//  AnalyticEventAndCompletion.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

public typealias EventLoggedCompletion = (Result<Void, Error>) -> Void

struct AnalyticEventAndCompletion: Identifiable {
    let uniqueId: UUID = UUID()
    let analyticEvent: AnalyticEvent
    let analyticsCompletion: EventLoggedCompletion?
}

extension AnalyticEventAndCompletion: Equatable {
    static func == (lhs: AnalyticEventAndCompletion, rhs: AnalyticEventAndCompletion) -> Bool {
        return lhs.analyticEvent == rhs.analyticEvent
    }
}

extension AnalyticEventAndCompletion: Encodable {
    enum CodingKeys: String, CodingKey {
        case analyticEvent
    }
}

extension AnalyticEventAndCompletion: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        analyticEvent = try values.decode(AnalyticEvent.self, forKey: .analyticEvent)
        analyticsCompletion = nil
    }
}
