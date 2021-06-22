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
}

public struct CollectionNotes: Codable, Equatable {

    public let preorder: String
    public let checkin: String

    enum CodingKeys: String, CodingKey {
        case preorder = "VIRTUAL_QUEUE_PREORDER"
        case checkin = "VIRTUAL_QUEUE_CHECKIN"
    }
}
