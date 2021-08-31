//
//  ProductModifierItemStatus.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2021/8/31.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum ProductModifierItemStatus: String, Codable {
    case active
    case disabled

    init?(response: ApolloType.ProductModifierItemStatus?) {
        switch response {
        case .active:
            self = .active
        case .disabled:
            self = .disabled
        default:
            return nil
        }
    }
}
