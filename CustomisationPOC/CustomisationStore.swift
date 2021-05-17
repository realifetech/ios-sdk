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
}

class CustomisationStore: CustomisationStorable {
    var colourStore: ColourStorable

    init(colourStore: ColourStorable) {
        self.colourStore = colourStore
    }
}
