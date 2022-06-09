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
        case id, title, subtitle, url, imageUrl, language
    }
    public let id: Int?
    public let title: String?
    public let subtitle: String?
    public let imageUrl: URL?
    public let language: String?
    internal let url: String?
    internal var linkAnalyticsEvent: (() -> Void)?

    public func generateLinkHandler(openHandler: @escaping (URL) -> Void) -> () -> Void {
        Self.generateLinkHandler(url: url, linkAnalyticsEvent: linkAnalyticsEvent, openHandler: openHandler)
    }
}
