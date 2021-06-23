//
//  ProductModifierList.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierList: Codable, Equatable {

    public let id: String
    public let multipleSelect: Bool?
    public let mandatorySelect: Bool?
    public let maxAllowed: Int?
    public let items: [ProductModifierItem]?
    public let translations: [StandardTitleTranslation]?
}
