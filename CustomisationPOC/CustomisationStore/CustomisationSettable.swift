//
//  CustomisationSettable.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit

// Public interface we extend the Factory with to allow users to update the customisation stores
public protocol CustomisationSettable {

    static func setColour(_: RealifeTechColourKey, value: UIColor)
    static func setFont(_: RealifeTechFontKey, value: UIFont)
    static func setLocalisableString(
        _: RealifeTechLocalisableStringKey,
        value: [(languageCode: String, translation: String)])
    static func setConfigurationBool(_: RLTConfigurationBoolKey, value: Bool)
    static func setConfigurationFloat(_: RLTConfigurationFloatKey, value: Float)
    static func setImage(_: RealifeTechImageKey, value: UIImage)
}
