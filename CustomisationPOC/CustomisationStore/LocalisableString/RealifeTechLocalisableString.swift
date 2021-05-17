//
//  RealifeTechLocalisableString+KeyPair.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public enum RealifeTechLocalisableStringKey {
    case proofOfConceptHeadline, proofOfConceptSubtitle
}

struct RealifeTechLocalisableString {
    
    let key: RealifeTechLocalisableStringKey
    let value: [(languageCode: String, translation: String)]
}

extension RealifeTechLocalisableString: Equatable, Hashable {
    static func == (lhs: RealifeTechLocalisableString, rhs: RealifeTechLocalisableString) -> Bool {
        return lhs.key == rhs.key
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(key)
    }
}
