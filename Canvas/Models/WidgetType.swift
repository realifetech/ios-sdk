//
//  WidgetType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 05/07/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum WidgetType: String, Codable {
    case unknown
    case product = "Product"
    case button = "Button"
    case banner = "Banner"
    case event = "Event"
    case fixture = "Fixture"
    case countdownClock = "CountdownClock"
    case galleryCoverImage = "GalleryCoverImage"
    case news = "News"
    case ticket = "Ticket"
    case ticketProduct = "TicketProduct"
    case fulfilmentPoint = "FulfilmentPoint"
    case socialPost = "SocialPost"
    case fulfilmentPointCategorySelector = "FulfilmentPointCategorySelector"
    case selectedEvent = "SelectedEvent"
    case dynamic = "Dynamic"
}

extension WidgetType {

    init?(apolloType: ApolloType.WidgetType?) {
        guard let type = WidgetType(rawValue: apolloType?.rawValue ?? "") else {
            return nil
        }
        self = type
    }
}
