//
//  ColorType.swift
//  RealifeTech
//
//  Created by Mickey Lee on 20/08/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import SwiftUI

public enum ColorType {
    case primary
    case onPrimary
    case surface
    case onSurface
    case neutral
}

extension ColorType {

    var `default`: Color {
        switch self {
        case .primary:
            return .init(hex: "FFFFFF")
        case .onPrimary:
            return .init(hex: "000000")
        case .surface:
            return .init(hex: "f7f7f7")
        case .onSurface:
            return .init(hex: "083C62")
        case .neutral:
            return .init(hex: "BDBBBB")
        }
    }
}
