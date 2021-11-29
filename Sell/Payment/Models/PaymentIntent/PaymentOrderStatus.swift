//
//  PaymentOrderStatus.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2021/11/26.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum PaymentOrderStatus: String, Codable {

    case standing = "STANDING"
    case succeed = "SUCCEED"
    case declined = "DECLINED"

    var apolloType: ApolloType.PaymentOrderStatus {
        switch self {
        case .standing:
            return .standing
        case .succeed:
            return .succeed
        case .declined:
            return .declined
        }
    }
}
