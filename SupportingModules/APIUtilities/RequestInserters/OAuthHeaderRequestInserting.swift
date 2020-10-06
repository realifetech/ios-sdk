//
//  OAuthHeaderRequestInserting.swift
//  CLArena
//
//  Created by Ross Patman on 04/05/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

protocol OAuthHeaderRequestInserting {
    static func addOAuthHeader(toRequest request: URLRequest) -> URLRequest
}

extension OAuthHeaderRequestInserting {
    static func addOAuthHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        guard V3APITokenManager.sharedInstance.tokenIsValid, let accessToken = V3APITokenManager.sharedInstance.token else { return request }
        let oAuthHeader = RequestHeader.generateAuthHeader(accessToken: accessToken)
        request.addValue(oAuthHeader.valueForHeader, forHTTPHeaderField: oAuthHeader.header)
        return request
    }
}
