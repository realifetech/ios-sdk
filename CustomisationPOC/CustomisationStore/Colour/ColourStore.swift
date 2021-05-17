//
//  ColourStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

protocol ColourStorable {
    func setColour(key: RealifeTechColourKey, value: UIColor)
    func get(key: RealifeTechColourKey) -> UIColor?
}

class ColourStore: ColourStorable {
    private var storedColours = Set<RealifeTechColour>()

    func setColour(key: RealifeTechColourKey, value: UIColor) {
        storedColours.update(with: .init(key: key, colour: value))
    }

    func get(key: RealifeTechColourKey) -> UIColor? {
        return storedColours.first { $0.key == key }?.colour
    }
}
