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
    var localisableStringStore: LocalisableStringStorable { get }
    var configurationStore: ConfigurationStorable { get }
    var imageStore: ImageStorable { get }
}

class CustomisationStore: CustomisationStorable {
    
    let colourStore: ColourStorable
    let fontStore: FontStorable
    let localisableStringStore: LocalisableStringStorable
    let imageStore: ImageStorable
    let configurationStore: ConfigurationStorable

    init(
        colourStore: ColourStorable,
        fontStore: FontStorable,
        localisableStringStore: LocalisableStringStorable,
        imageStore: ImageStorable,
        configurationStore: ConfigurationStorable
    ) {
        self.colourStore = colourStore
        self.fontStore = fontStore
        self.localisableStringStore = localisableStringStore
        self.imageStore = imageStore
        self.configurationStore = configurationStore
    }
}
