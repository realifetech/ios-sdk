//
//  RLTBanner.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

struct RLTBanner: RLTDataModel, RLTLinkHandling {
    private enum CodingKeys: String, CodingKey {
        case title, link
    }
    let title: String?
    internal var link: String?
    internal var linkAnalyticsEvent: (() -> Void)?
}
