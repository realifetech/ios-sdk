//
//  UserRequester.swift
//  CLArena
//
//  Created by apple on 09/04/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

struct UserRequester: Requester, APIV3Requester {
    static var endpoint: String? = "/users"
}

extension UserRequester {
    static func profile(withID id: String? = nil) -> URLRequest {
        let theEndpoint = id != nil ? "\(endpoint!)/\(id!)" : "\(endpoint!)/profile"
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: theEndpoint, httpMethod: .GET)
    }
}
