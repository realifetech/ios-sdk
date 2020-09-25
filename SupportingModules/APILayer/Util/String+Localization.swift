//
//  String+Localization.swift
//  APILayer
//
//  Created by apple on 13/09/2019.
//  Copyright © 2019 LiveStyled. All rights reserved.
//

import Foundation

extension String {
    var localizedString: String {
        var localizedString = ""
        localizedString = NSLocalizedString(self, tableName: "Accessibility", bundle: Bundle.main, comment: "")
        if localizedString != self { return localizedString }
        return NSLocalizedString(self, tableName: "APILayer", bundle: Bundle.main, comment: "")
    }
}
