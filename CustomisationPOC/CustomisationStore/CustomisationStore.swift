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
    var localisableStringStore: LocalisableStringStore { get }
}

class CustomisationStore: CustomisationStorable {
    let colourStore: ColourStorable
    let fontStore: FontStorable
    let localisableStringStore: LocalisableStringStore

    init(
        colourStore: ColourStorable,
        fontStore: FontStorable,
        localisableStringStore: LocalisableStringStore
    ) {
        self.colourStore = colourStore
        self.fontStore = fontStore
        self.localisableStringStore = localisableStringStore
    }
}
