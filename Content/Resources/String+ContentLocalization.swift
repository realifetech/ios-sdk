//
//  String+ContentLocalization.swift
//  RealifeTech
//
//  Created by Mickey Lee on 02/03/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

extension String {

    var contentLocalizedString: String {
        return NSLocalizedString(
            self,
            tableName: "Content",
            bundle: .contentResourceBundle,
            comment: "")
    }
}

extension Bundle {

    static var contentResourceBundle: Bundle {
        guard
            let path = Bundle(for: ContentImplementing.self)
                .path(forResource: "RealifeTech", ofType: "bundle"),
            let bundle = Bundle(path: path)
        else {
            return .main
        }
        return bundle
    }
}
