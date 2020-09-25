//
//  RequestHeader.swift
//  ConcertLiveCore
//
//  Created by J.Albert on 13/06/2017.
//  Copyright © 2017 J.Albert. All rights reserved.
//

import Foundation

struct RequestHeader {

    private enum HeaderKeys: String {
        case deviceId = "X-Ls-DeviceId"
        case authorization = "Authorization"
        case basicAuthorization = "Basic"
        case bearerAuthorization = "Bearer"
        case acceptLanguage = "Accept-Language"
    }

    var header: String

    var valueForHeader: String

    static func generateDeviceIdHeader(deviceId: String) -> RequestHeader {
        return RequestHeader(header: HeaderKeys.deviceId.rawValue, valueForHeader: deviceId)
    }

    static func generateAuthHeader(accessToken: String) -> RequestHeader {
        return RequestHeader(header: HeaderKeys.authorization.rawValue, valueForHeader: "\(HeaderKeys.bearerAuthorization.rawValue) \(accessToken)")
    }

    static func generateAuthHeader(credentialsString: String) -> RequestHeader {
        return RequestHeader(header: HeaderKeys.authorization.rawValue, valueForHeader: "\(HeaderKeys.basicAuthorization.rawValue) \(RequestHeader.encodeCredentialString(credentialsString: credentialsString))")
    }

    static func encodeCredentialString(credentialsString: String) -> String {
        let loginData = credentialsString.data(using: .utf8)!
        return loginData.base64EncodedString()
    }
    
    static func generateAcceptLanguageHeader(languageCode: String?) -> RequestHeader {
        let theLanguageCode: String = languageCode ?? "en"
        return RequestHeader(header: HeaderKeys.acceptLanguage.rawValue, valueForHeader: theLanguageCode)
    }
}
