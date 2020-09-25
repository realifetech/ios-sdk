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
            return EnvironmentVariableAccessor.sharedInstance.concertLiveAPIBaseURLV3
        }
    }
    var rawValue: String {
        return urlString
    }
}
