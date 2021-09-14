//
//  StandardTitleTranslation.swift
//  RealifeTech
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public struct StandardTitleTranslation: Codable, Equatable, Hashable {

    public let language: String?
    public let title: String?

    public init(language: String?, title: String?) {
        self.language = language
        self.title = title
    }
}
