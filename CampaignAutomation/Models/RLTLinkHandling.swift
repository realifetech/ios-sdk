//
//  RLTLinkHandling.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol RLTLinkHandling {
    var link: String? { get }
    var linkAnalyticsEvent: (() -> Void)? { get }
}

/*
 I would have preferred to have this remain private but be accessible
 through the individual data models, but that doesn't seem possible
 */
extension RLTLinkHandling {
    static func generateLinkHandler(link: String?,
                                    linkAnalyticsEvent: (() -> Void)?,
                                    openHandler: @escaping (URL) -> Void) -> () -> Void {
        return {
            linkAnalyticsEvent?()
            guard let link = link, let url = URL(string: link) else { return }
            openHandler(url)
        }
    }
}
