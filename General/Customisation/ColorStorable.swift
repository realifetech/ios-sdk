//
//  ColorStorable.swift
//  RealifeTech
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import UIKit
import SwiftUI

public protocol ColorStorable {
    func setColor(_ color: UIColor, for type: ColorType)
    func getColor(for type: ColorType) -> Color
}

struct PreviewColorStore: ColorStorable {

    func setColor(_ color: UIColor, for type: ColorType) { }

    func getColor(for type: ColorType) -> Color {
        return Color(UIColor.clear)
    }
}
