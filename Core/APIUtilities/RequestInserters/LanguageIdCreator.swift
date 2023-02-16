//
//  LanguageIdCreator.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/2/10.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

struct LanguageIdCreator {

    func getLanguageId(preferredLanguages: [String] = Locale.preferredLanguages) -> String {
        var languageId = "en"
        if let preferredLanguage = preferredLanguages.first {
            languageId = String(preferredLanguage.prefix(2))
        }
        return languageId
    }
}
