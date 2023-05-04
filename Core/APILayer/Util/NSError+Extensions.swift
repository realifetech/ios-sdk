//
//  NSError.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/5/4.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

extension NSError {

    var isNoConnection: Bool {
        let intCode = Int32(code)
        if intCode == CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue ||
            intCode == CFNetworkErrors.cfurlErrorTimedOut.rawValue ||
            intCode == CFNetworkErrors.cfurlErrorNetworkConnectionLost.rawValue ||
            intCode == CFNetworkErrors.cfurlErrorCannotFindHost.rawValue {
            return true
        } else {
            return false
        }
    }
}
