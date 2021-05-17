//
//  StringStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol LocalisableStringStorable {
    var languageCode: String { get set }
    func setLocalisableString(_ key: RealifeTechLocalisableStringKey, value: [(languageCode: String, translation: String)])
    func get(_ key: RealifeTechLocalisableStringKey) -> String?
}

class LocalisableStringStore: LocalisableStringStorable {
    var languageCode: String = "en_GB"
    private var storedStrings = Set<RealifeTechLocalisableString>()

    func setLocalisableString(_ key: RealifeTechLocalisableStringKey, value: [(languageCode: String, translation: String)]) {
        storedStrings.update(with: .init(key: key, value: value))
    }

    func get(_ key: RealifeTechLocalisableStringKey) -> String? {
        guard let possibleValues = storedStrings.first(where: { $0.key == key })?.value else {
            return nil
        }
        return possibleValues.first(where: { $0.languageCode == languageCode })?.translation
    }
}
