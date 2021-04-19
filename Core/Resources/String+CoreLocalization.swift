//
//  String+CoreLocalization.swift
//  APILayer
//
//  Copyright © 2020 Realife Tech. All rights reserved.
//

import Foundation

extension String {

    var coreLocalizedString: String {
        return NSLocalizedString(
            self,
            tableName: "Core",
            bundle: .coreResourceBundle,
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
