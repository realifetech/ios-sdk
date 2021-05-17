//
//  ColourStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

protocol ColourStorable {
    func setColour(key: RealifeTechColour, value: UIColor)
    func getColour(key: RealifeTechColour) -> UIColor?
}

class ColourStore: ColourStorable {
    private var storedColours = Set<ColourKeyPairValue>()

    func setColour(key: RealifeTechColour, value: UIColor) {
        storedColours.update(with: .init(key: key, colour: value))
    }

    func getColour(key: RealifeTechColour) -> UIColor? {
        return storedColours.first { $0.key == key }?.colour
    }
}
