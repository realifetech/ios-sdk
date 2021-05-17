//
//  RealifeTechColour.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public enum RealifeTechColourKey {
    case backgorund, text, textSecondary
}

struct RealifeTechColour {
    let key: RealifeTechColourKey
    let colour: UIColor
}

extension RealifeTechColour: Equatable, Hashable {
    static func == (lhs: RealifeTechColour, rhs: RealifeTechColour) -> Bool {
        return lhs.key == rhs.key
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(key)
    }
}
