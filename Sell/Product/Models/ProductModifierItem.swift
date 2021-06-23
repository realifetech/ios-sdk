//
//  ProductModifierItem.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct ProductModifierItem: Codable, Equatable{

    public let id: String
    public let additionalPrice: Int?
    public let translations: [StandardTitleTranslation]?
}
