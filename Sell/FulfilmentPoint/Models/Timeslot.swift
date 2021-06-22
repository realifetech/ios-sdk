//
//  Timeslot.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct Timeslot: Codable, Equatable {

    public let id: String
    public let startTime: String?
    public let endTime: String?
    public let translations: [TimeslotTranslation]?
}

public struct TimeslotTranslation: Codable, Equatable {

    public let language: String?
    public let title: String?
    public let description: String?
    public let collectionNote: String?
}
