//
//  RealifeTechFont+KeyPair.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public enum RealifeTechFontKey {
    case headline, body
}

struct RealifeTechFont {
    let key: RealifeTechFontKey
    let value: UIFont
}

extension RealifeTechFont: Equatable, Hashable {
    static func == (lhs: RealifeTechFont, rhs: RealifeTechFont) -> Bool {
        return lhs.key == rhs.key
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(key)
    }
}
