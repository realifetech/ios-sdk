//
//  NotificationConsent.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/4/7.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public enum NotificationConsentStatus: String {
    case active = "ACTIVE"
    case disabled = "DISABLED"
}

public struct NotificationConsent {
    public let id: String
    public let name: String
    public let sortId: Int
    public let status: NotificationConsentStatus
    public let translations: [StandardTitleTranslation]?

    public init(
        id: String,
        name: String,
        sortId: Int,
        status: NotificationConsentStatus,
        translations: [StandardTitleTranslation]?
    ) {
        self.id = id
        self.name = name
        self.sortId = sortId
        self.status = status
        self.translations = translations
    }
}

extension NotificationConsent {

    init?(response: ApolloType.NotificationConsentFragment?) {
        guard let response = response else { return nil }
        self.id = response.id
        self.name = response.name
        self.sortId = response.sortId
        self.status = NotificationConsentStatus(rawValue: response.status.rawValue) ?? .disabled
        self.translations = response.translations?.compactMap {
            StandardTitleTranslation(language: $0?.language, title: $0?.name)
        }
    }
}
