//
//  FulfilmentPointTranslation.swift
//  RealifeTech
//
//  Created by Mickey Lee on 22/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct FulfilmentPointTranslation: Codable, Equatable {

    public let language: String?
    public let title: String?
    public let description: String?
    public let collectionNote: String?
    public let collectionNotes: [CollectionNotes]?

    init(response: ApolloType.FragmentFulfilmentPoint.Translation?) {
        language = response?.language?.rawValue
        title = response?.title
        description = response?.description
        collectionNote = response?.collectionNote
        collectionNotes = response?.collectionNotes?.compactMap {
            CollectionNotes(response: $0)
        }
    }
}

public struct CollectionNotes: Codable, Equatable {

    public let preorder: String?
    public let checkin: String?

    init(response: ApolloType.FragmentFulfilmentPoint.Translation.CollectionNote?) {
        preorder = response?.virtualQueuePreorder
        checkin = response?.virtualQueueCheckin
    }
}
