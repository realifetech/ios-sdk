//
//  RealifeTechConfig.swift
//  RealifeTech
//
//  Created by Olivier Butler on 17/05/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

// Cannot use associated values as this breaks our ability to make comparisons
public enum RealifeTechConfigurationKey {
    case isThisAHappyApp, howLongToAnimateSeconds

    var type: ConfigurationType {
        switch self {
        case .isThisAHappyApp:
            return .bool
        case .howLongToAnimateSeconds:
            return .float
        }
    }
}

enum ConfigurationType {
    case bool, int, float, string
}

struct RealifeTechConfiguration {
    let key: RealifeTechConfigurationKey
    let value: Any

    init?(key: RealifeTechConfigurationKey, value: Any) {
        guard Self.checkValueIsTypeMatched(key: key, value: value) else { return nil }
        self.key = key
        self.value = value
    }

    private static func checkValueIsTypeMatched(key: RealifeTechConfigurationKey, value: Any) -> Bool {
        switch key.type {
        case .bool:
            return value is Bool
        case .int:
            return value is Int
        case .float:
            return value is Float
        case .string:
            return value is String
        }
    }
}

extension RealifeTechConfiguration: Equatable, Hashable {
    static func == (lhs: RealifeTechConfiguration, rhs: RealifeTechConfiguration) -> Bool {
        return lhs.key == rhs.key
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(key)
    }
}
