//
//  RLTBanner.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct RLTBanner: RLTDataModel, RLTLinkHandling {
    private enum CodingKeys: String, CodingKey {
        case title, subtitle, url, imageUrl, language
    }
    let title: String?
    let subtitle: String?
    internal let url: URL?
    let imageUrl: URL?
    let language: String?
    internal var linkAnalyticsEvent: (() -> Void)?

    public func generateLinkHandler(openHandler: @escaping (URL) -> Void) -> () -> Void {
        Self.generateLinkHandler(url: url, linkAnalyticsEvent: linkAnalyticsEvent, openHandler: openHandler)
    }
}
