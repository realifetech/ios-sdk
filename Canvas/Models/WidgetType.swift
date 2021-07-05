//
//  WidgetType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum WidgetType: String, Codable {
    case product
    case button
    case banner
    case event
    case fixture
    case countdownClock
    case galleryCoverImage
    case news
    case ticket
    case ticketProduct
    case fulfilmentPoint
    case socialPost
    case fulfilmentPointCategorySelector
    case selectedEvent
}

extension WidgetType {

    init?(apolloType: ApolloType.WidgetType?) {
        guard let type = WidgetType(rawValue: apolloType?.rawValue ?? "") else {
            return nil
        }
        self = type
    }
}
