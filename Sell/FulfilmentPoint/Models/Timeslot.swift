//
//  Timeslot.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
import GraphQL

public struct Timeslot: Codable, Equatable {

    public let id: String
    public let startTime: String?
    public let endTime: String?
    public let translations: [TimeslotTranslation]?

    public init(
        id: String,
        startTime: String?,
        endTime: String?,
        translations: [TimeslotTranslation]?
    ) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.translations = translations
    }
}

extension Timeslot {

    init?(response: ApolloType.FragmentTimeslot?) {
        guard let response = response else { return nil }
        id = response.id
        startTime = response.startTime
        endTime = response.endTime
        translations = response.translations?.compactMap {
            TimeslotTranslation(response: $0)
        }
    }
}

public struct TimeslotTranslation: Codable, Equatable {

    public let language: String?
    public let title: String?
    public let description: String?
    public let collectionNote: String?

    public init(
        language: String?,
        title: String?,
        description: String?,
        collectionNote: String?
    ) {
        self.language = language
        self.title = title
        self.description = description
        self.collectionNote = collectionNote
    }
}

extension TimeslotTranslation {

    init(response: ApolloType.FragmentTimeslot.Translation?) {
        language = response?.language?.rawValue
        title = response?.title
        description = response?.description
        collectionNote = response?.collectionNote
    }
}
