//
//  CampaignAutomation.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

struct RLTResponseItem {
    let contentType: String
    let data: [String: Any]
    var unwrappedContentType: RLTContentType {
        RLTContentType(rawValue: contentType) ?? .unknown
    }
    var unwrappedDataModel: RLTDataModel? {
        return unwrappedContentType.correspondingDataModel?.create(json: data)
    }
}

public protocol CampaignAutomation {
    func generateCreatables(for location: String,
                            factories: [RLTContentType: RLTCreatableFactory],
                            completion: (Result<[RLTCreatable], Error>) -> Void)
    var viewFetcher: RLTViewFetcher { get }
}
