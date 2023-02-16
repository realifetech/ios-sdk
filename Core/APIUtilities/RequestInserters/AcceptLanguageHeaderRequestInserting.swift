//
//  AcceptLanguageHeaderRequestInserting.swift
//  RealifeTech
//
//  Created by Ross Patman Work on 18/10/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import Foundation

public protocol AcceptLanguageHeaderRequestInserting {
    static func addLanguageHeader(toRequest request: URLRequest) -> URLRequest
}

extension AcceptLanguageHeaderRequestInserting {

    public static func addLanguageHeader(toRequest request: URLRequest) -> URLRequest {
        var request = request
        let languageId = LanguageIdCreator().getLanguageId()
        request.addValue(languageId, forHTTPHeaderField: "Accept-Language")
        return request
    }
}
