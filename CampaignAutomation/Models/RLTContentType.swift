//
//  RLTContentType.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

enum RLTContentType: String {
    case banner, unknown
    var correspondingDataModel: RLTDataModel.Type? {
        switch self {
        case .banner: return RLTBanner.self
        case .unknown: return nil
        }
    }
}
