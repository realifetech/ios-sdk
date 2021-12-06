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

extension RLTLinkHandling {
    func generateLinkHandler(openHandler: @escaping (URL) -> Void) -> () -> Void {
        return {
            linkAnalyticsEvent?()
            guard let link = link, let url = URL(string: link) else { return }
            openHandler(url)
        }
    }
}
