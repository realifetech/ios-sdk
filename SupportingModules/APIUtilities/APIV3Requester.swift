//
//  APIV3Requester.swift
//  CLArena
//
//  Created by Ross Patman on 15/02/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import RxSwift
import APILayer

protocol APIV3Requester: JSONContentTypeHeaderRequestInserting, DeviceIdHeaderRequestInserting, OAuthHeaderRequestInserting, OAuthRefreshOrWaitActionGenerator {
    static func root() -> RequestRootURL
    static func preDispatchAction() -> Observable<Any?>?
    static func interceptors() -> [(URLRequest) -> (URLRequest)]?
    static func dateFormat() -> RequesterDateFormat?
}

extension APIV3Requester {
    static func root() -> RequestRootURL {
        return RequestBaseURL.LSBaseURLV3
    }

    static func preDispatchAction() -> Observable<Any?>? {
        return refreshTokenOrWaitAction
    }

    static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        return [
            addJSONContentTypeHeader,
            addDeviceIdHeader,
            addOAuthHeader
        ]
    }

    static func dateFormatString() -> String {
        return "yyyy-MM-dd'T'HH:mm:ssZ"
    }

    static func dateFormat() -> RequesterDateFormat? {
        return .formatted(format: dateFormatString(), localeIdentifier: "en_US_POSIX")
    }
}

extension APIV3Requester {
    static func format(date: Date, format: String? = nil) -> String {
        let dateFormat = format ?? dateFormatString()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
}
