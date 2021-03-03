//
//  WebPage.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct WebPage {

    public let url: URL

    public enum `Type`: String, CaseIterable {
        case audioGuidesHelp
        case tAndC
        case privacy
        case about
        case aboutCompany
        case purchasesHelp

        public init?(value: String) {
            guard
                let type = WebPageType.allCases.first(where: { $0.rawValue.lowercased() == value.lowercased() })
            else { return nil }
            self = type
        }
    }
}
