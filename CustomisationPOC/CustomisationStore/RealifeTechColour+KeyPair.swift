//
//  Colours.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public enum RealifeTechColour {
    case backgorund, text, textSecondary
}

struct ColourKeyPairValue {
    let key: RealifeTechColour
    let colour: UIColor
}

extension ColourKeyPairValue: Equatable, Hashable {
    static func == (lhs: ColourKeyPairValue, rhs: ColourKeyPairValue) -> Bool {
        return lhs.key == rhs.key
    }
}
