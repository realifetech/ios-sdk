//
//  RealifeTechFont+KeyPair.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

public enum RealifeTechFont {
    case headline, body
}

struct FrontKeyPairValue {
    let key: RealifeTechFont
    let value: UIFont
}

extension FrontKeyPairValue: Equatable, Hashable {
    static func == (lhs: FrontKeyPairValue, rhs: FrontKeyPairValue) -> Bool {
        return lhs.key == rhs.key
    }
}
