//
//  ProductModifierItemStatus.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2022/3/16.
//  Copyright © 2022 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum ProductModifierItemStatus: String, Codable {
    case active = "ACTIVE"
    case disabled = "DISABLED"
}
