//
//  String+Localization.swift
//  APILayer
//
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

enum LocalisedGroup: String {
    case core = "Core"
    case content = "Content"
}

extension LocalisedGroup {

    var resourceBundle: Bundle {
        switch self {
        case .core:
            return .coreResourceBundle
        case .content:
            return .contentResourceBundle
        }
    }
}

extension String {

    func getLocalizedString(for group: LocalisedGroup) -> String {
        return NSLocalizedString(
            self,
            tableName: group.rawValue,
            bundle: group.resourceBundle,
            comment: "")
    }
}

extension Bundle {

    static var coreResourceBundle: Bundle {
        guard
            let path = Bundle(for: APIError.self)
                .path(forResource: "RealifeTech", ofType: "bundle"),
            let bundle = Bundle(path: path)
        else {
            return .main
        }
        return bundle
    }
}
