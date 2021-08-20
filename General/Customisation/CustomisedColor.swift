//
//  CustomisedColor.swift
//  RealifeTech
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

struct CustomisedColor {
    let type: ColorType
    let color: UIColor
}

extension CustomisedColor: Equatable, Hashable {

    static func == (lhs: CustomisedColor, rhs: CustomisedColor) -> Bool {
        return lhs.type == rhs.type
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
}
