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

public protocol CampaignAutomation {
    var viewFetcher: RLTViewFetcher { get }
    func generateCreatables(for location: String,
                            factories: [RLTContentType: RLTCreatableFactory],
                            completion: @escaping (Result<[RLTCreatable], Error>) -> Void)
    func fetchRLTDataModels(for location: String, completion: @escaping (Result<[RLTItem], Error>) -> Void)
}
