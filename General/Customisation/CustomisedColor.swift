//
//  CustomisedColor.swift
//  RealifeTech
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

struct CustomisedColor {
    let key: ColorType
    let color: UIColor
}

extension CustomisedColor: Equatable, Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}
