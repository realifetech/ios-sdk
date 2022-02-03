//
//  CampaignAutomationFactory.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct CampaignAutomationFactory {
    static func makeModule(
        graphQLManager: GraphQLManageable,
        analyticsLogger: Analytics
    ) -> CampaignAutomation {
        return CampaignAutomationImplementing(graphQLManager: graphQLManager,
                                              defaultFetcher: RLTViewFetcher(),
                                              analyticsLogger: analyticsLogger)
    }
}
