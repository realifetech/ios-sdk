//
//  FontStore.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

protocol FontStorable {
    func setValue(key: RealifeTechFontKey, value: UIFont)
    func getValue(key: RealifeTechFontKey) -> UIFont?
}

class FontStore: FontStorable {
    private var storedFonts = Set<RealifeTechFont>()

    func setValue(key: RealifeTechFontKey, value: UIFont) {
        storedFonts.update(with: .init(key: key, value: value))
    }

    func getValue(key: RealifeTechFontKey) -> UIFont? {
        return storedFonts.first(where: { $0.key == key})?.value
    }
}
