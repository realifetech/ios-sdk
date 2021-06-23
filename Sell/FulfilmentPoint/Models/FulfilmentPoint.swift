//
//  FulfilmentPoint.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct FulfilmentPoint: Codable, Equatable {

    public let id: String
    public let type: FulfilmentPointType?
    public let imageUrl: String?
    public let mapImageUrl: String?
    public let lat: Double?
    public let long: Double?
    public let waitTime: Int?
    public let prepTime: Int?
    public let position: Int?
    public let translations: [FulfilmentPointTranslation]?
    public let seatFormId: String?
    public let categories: [FulfilmentPointCategory]?
    public let timeslots: [Timeslot]?

    init?(response: ApolloType.FragmentFulfilmentPoint?) {
        guard let response = response else { return nil }
        id = response.id
        type = FulfilmentPointType(rawValue: response.type?.rawValue ?? "")
        imageUrl = response.imageUrl
        mapImageUrl = response.mapImageUrl
        lat = response.lat
        long = response.long
        waitTime = response.waitTime
        prepTime = response.prepTime
        position = response.position
        translations = response.translations?.compactMap {
            FulfilmentPointTranslation(response: $0)
        }
        seatFormId = response.seatForm?.fragments.fragmentForm.id
        categories = response.categories?.compactMap {
            FulfilmentPointCategory(response: $0?.fragments.fragmentFulfilmentPointCategory)
        }
        timeslots = response.timeslots?.compactMap {
            Timeslot(response: $0?.fragments.fragmentTimeslot)
        }
    }
}
