//
//  RLTLinkHandling.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 03/12/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

internal protocol RLTLinkHandling {
    var url: URL? { get }
    var linkAnalyticsEvent: (() -> Void)? { get set }
}

/*
 I would have preferred to have this remain private but be accessible
 through the individual data models, but that doesn't seem possible
 */
internal extension RLTLinkHandling {
    static func generateLinkHandler(url: URL?,
                                    linkAnalyticsEvent: (() -> Void)?,
                                    openHandler: @escaping (URL) -> Void) -> () -> Void {
        return {
            linkAnalyticsEvent?()
            guard let url = url else { return }
            openHandler(url)
        }
    }
}
