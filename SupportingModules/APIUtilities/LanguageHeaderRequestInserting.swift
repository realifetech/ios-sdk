//
//  LanguageHeaderProviding.swift
//  ConcertLiveCore
//
//  Created by Ross Patman on 13/11/2017.
//  Copyright © 2017 ConcertLive. All rights reserved.
//

import Foundation
import APILayer

protocol LanguageHeaderRequestInserting {
    static func addLanguageHeader(toRequest request: URLRequest) -> URLRequest
}

extension LanguageHeaderRequestInserting {
    static func addLanguageHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        request.addValue(AppConfig.languageCode, forHTTPHeaderField: "Accept-Language")
        return request
    }
}
