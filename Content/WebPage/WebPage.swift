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
        case important
        case info
        case times
        case event
        case welcome
        case travel
        case faq
        case food
        case program
        case social
        case menu
        case legal
        case quizHelp
        case quizTerms
        case quizWinner
        case ntpTerms

        /// Initialise the `Type` with the plain text which may be camel case, lowercase or uppercase.
        /// Returns nil when there's no corresponding type in WebPage.`Type`
        /// - Parameter value: String type with any format
        public init?(value: String) {
            guard
                let type = WebPageType.allCases.first(where: { $0.rawValue.lowercased() == value.lowercased() })
            else { return nil }
            self = type
        }
    }
}
