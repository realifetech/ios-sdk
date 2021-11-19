//
//  OrderUpdateInput.swift
//  RealifeTech
//
//  Created by Mickey Lee on 28/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct OrderUpdateInput {

    public let status: String?
    public let collectionPreferenceType: CollectionPreferenceType?
    public let checkInTime: String?

    public init(
        status: String?,
        collectionPreferenceType: CollectionPreferenceType?,
        checkInTime: String?
    ) {
        self.status = status
        self.collectionPreferenceType = collectionPreferenceType
        self.checkInTime = checkInTime
    }
}
