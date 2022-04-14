//
//  Analytics.swift
//  RealifeTech
//
//  Created by Olivier Butler on 21/10/2020.
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public typealias Analytics = AnalyticsLogging

public struct PutAnalyticEventResponse {
    public var success: Bool
    public var message: String?
}

extension PutAnalyticEventResponse {

    init?(response: ApolloType.PutAnalyticEventMutation.Data?) {
        guard let putAnalyticEvent = response?.putAnalyticEvent else { return nil }
        success = putAnalyticEvent.success
        message = putAnalyticEvent.message
    }
}
