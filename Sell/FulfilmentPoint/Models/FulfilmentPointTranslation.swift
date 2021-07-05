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
    public let collectionNotes: CollectionNotes?

    public init(
        language: String?,
        title: String?,
        description: String?,
        collectionNote: String?,
        collectionNotes: CollectionNotes?
    ) {
        self.language = language
        self.title = title
        self.description = description
        self.collectionNote = collectionNote
        self.collectionNotes = collectionNotes
    }
}

extension FulfilmentPointTranslation {

    init(response: ApolloType.FragmentFulfilmentPoint.Translation?) {
        language = response?.language?.rawValue
        title = response?.title
        description = response?.description
        collectionNote = response?.collectionNote
        collectionNotes = CollectionNotes(response: response?.collectionNotes)
    }
}

public struct CollectionNotes: Codable, Equatable {

    public let preorder: String?
    public let checkin: String?

    public init(preorder: String?, checkin: String?) {
        self.preorder = preorder
        self.checkin = checkin
    }
}

extension CollectionNotes {

    init(response: ApolloType.FragmentFulfilmentPoint.Translation.CollectionNote?) {
        preorder = response?.virtualQueuePreorder
        checkin = response?.virtualQueueCheckin
    }
}
