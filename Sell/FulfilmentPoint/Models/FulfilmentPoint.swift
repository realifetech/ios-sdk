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
}
