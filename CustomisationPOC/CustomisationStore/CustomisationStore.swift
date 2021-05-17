//
//  CustomisationStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

protocol CustomisationStorable {
    var colourStore: ColourStorable { get }
    var fontStore: FontStorable { get }
}

class CustomisationStore: CustomisationStorable {
    var colourStore: ColourStorable
    var fontStore: FontStorable

    init(colourStore: ColourStorable, fontStore: FontStorable) {
        self.colourStore = colourStore
        self.fontStore = fontStore
    }
}
