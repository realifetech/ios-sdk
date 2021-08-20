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

final class EmptyColorStore: ColorStorable {

    private(set) var colors = Set<CustomisedColor>()

    func setColor(_ color: UIColor, for type: ColorType) {
        colors.update(with: .init(type: type, color: color))
    }

    func getColor(for type: ColorType) -> Color {
        let color = colors.first(where: { $0.type == type })?.color ?? .clear
        return Color(color)
    }
}
