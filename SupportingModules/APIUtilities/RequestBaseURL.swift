//
//  RequestBaseURL.swift
//  ConcertLiveCore
//
//  Created by J.Albert on 13/06/2017.
//  Copyright © 2017 J.Albert. All rights reserved.
//

import Foundation
import APILayer

enum RequestBaseURL: RequestRootURL {
    case LSBaseURLV3

    var urlString: String {
        switch self {
        case .LSBaseURLV3:
            // TODO: Add refrence to some Environment store. EnvironmentVariableAccessor.sharedInstance.concertLiveAPIBaseURLV3
            return "api-dev.livestyled.com"
        }
    }
    var rawValue: String {
        return urlString
    }
}
