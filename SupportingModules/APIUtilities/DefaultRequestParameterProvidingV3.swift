//
//  DefaultRequestParamaterProvidingV3.swift
//  CLArena
//
//  Created by Ross Patman on 19/04/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

protocol DefaultRequestParameterProvidingV3 {
    static func createDefaultParameters(userId: Bool, eventId: Bool, venueId: Bool) -> [String: Any]
}

extension DefaultRequestParameterProvidingV3 {
    static var maxPageSize: Int { return 499 }
    static func createDefaultParameters(userId: Bool = true, eventId: Bool = false, venueId: Bool = false) -> [String: Any] {
        var parameters = [String: Any]()
        if userId {
            parameters["userId"] = URLHelper.userID
        }
// Definately not required
// 
//        if eventId, let theEventId = VenueEventSelectorDataManager.selectedEventId, !String(theEventId).isEmpty {
//            parameters["eventId"] = theEventId
//        }
//        if venueId, let theVenueId = VenueEventSelectorDataManager.selectedVenueId, !String(theVenueId).isEmpty {
//            parameters["venueId"] = theVenueId
//        }
//        if let appliedLoyaltyGroups = LoyaltyGroupSaver.appliedLoyaltyGroups {
//            parameters["appliedLoyaltyGroups"] = appliedLoyaltyGroups.compactMap { "\($0)" }.joined(separator: "&")
//        }
        return parameters
    }
}
