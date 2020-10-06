//
//  RequestBaseURL.swift
//  ConcertLiveCore
//
//  Created by J.Albert on 13/06/2017.
//  Copyright © 2017 J.Albert. All rights reserved.
//

import Foundation
import APILayer

var tokenManager: V3APITokenManagable = EmptyTokenManager()
var deviceId: String = ""
var apiRoot: RequestRootURL = APIRoot(rawValue: "")

// TODO: Can we remove this type now that we don't mix APIs in the same codebase?
struct APIRoot: RequestRootURL {
    let rawValue: String
}
