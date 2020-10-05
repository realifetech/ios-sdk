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
    static var baseURLV3: String = ""

    case LSBaseURLV3

    var rawValue: String {
        switch self {
        case .LSBaseURLV3:
            return RequestBaseURL.baseURLV3
        }
    }
}
