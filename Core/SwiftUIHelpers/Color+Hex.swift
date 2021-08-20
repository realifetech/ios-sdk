//
//  Color+Hex.swift
//  RealifeTech
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

extension Color {

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }

    func uiColor() -> UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        let components = makeComponents()
        return UIColor(
            red: components.red,
            green: components.green,
            blue: components.blue,
            alpha: components.alpha)
    }

    private func makeComponents() -> ColorComponent {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            return ColorComponent(
                alpha: CGFloat(hexNumber & 0x000000ff) / 255,
                red: CGFloat((hexNumber & 0xff000000) >> 24) / 255,
                green: CGFloat((hexNumber & 0x00ff0000) >> 16) / 255,
                blue: CGFloat((hexNumber & 0x0000ff00) >> 8) / 255)
        }
        return ColorComponent()
    }
}

private struct ColorComponent {
    let alpha: CGFloat
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat

    init(
        alpha: CGFloat = 0,
        red: CGFloat = 0,
        green: CGFloat = 0,
        blue: CGFloat = 0
    ) {
        self.alpha = alpha
        self.red = red
        self.green = green
        self.blue = blue
    }
}
