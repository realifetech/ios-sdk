//
//  JSONContentTypeHeaderRequestInserting.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 14/11/2017.
//  Copyright © 2017 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

protocol JSONContentTypeHeaderRequestInserting {
    static func addJSONContentTypeHeader(toRequest request: URLRequest) -> URLRequest
}

extension JSONContentTypeHeaderRequestInserting {
    static func addJSONContentTypeHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
}