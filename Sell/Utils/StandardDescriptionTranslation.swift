//
//  StandardDescriptionTranslation.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct StandardDescriptionTranslation: Codable, Equatable {

    public let language: String?
    public let title: String?
    public let description: String?

    init(
        language: String?,
        title: String?,
        description: String?
    ) {
        self.language = language
        self.title = title
        self.description = description
    }
}
