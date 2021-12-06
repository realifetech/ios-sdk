//
//  CampaignAutomationimplementing.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public class CampaignAutomationImplementing: CampaignAutomation {

    private let defaultFetcher: RLTViewFetcher!

    init(defaultFetcher: RLTViewFetcher) {
        self.defaultFetcher = defaultFetcher
    }

    public func generateCreatables(for location: String,
                                   factories: [RLTContentType: RLTCreatableFactory],
                                   completion: (Result<[RLTCreatable], Error>) -> Void) { }

    public var viewFetcher: RLTViewFetcher {
        return defaultFetcher
    }
}
