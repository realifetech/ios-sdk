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

    static func setColour(_: RealifeTechColour, value: UIColor)
    static func setFont(_: RealifeTechFont, value: UIFont)
    // other setters here
}
