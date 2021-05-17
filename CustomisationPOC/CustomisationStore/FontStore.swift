//
//  FontStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

protocol FontStorable {
    func setValue(key: RealifeTechFont, value: UIFont)
    func getValue(key: RealifeTechFont) -> UIFont?
}

class FontStore: FontStorable {
    private var storedFonts = Set<FrontKeyPairValue>()

    func setValue(key: RealifeTechFont, value: UIFont) {
        storedFonts.update(with: .init(key: key, value: value))
    }

    func getValue(key: RealifeTechFont) -> UIFont? {
        return storedFonts.first(where: { $0.key == key})?.value
    }
}
