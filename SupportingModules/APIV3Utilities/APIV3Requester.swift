//
//  APIV3Requester.swift
//  CLArena
//
//  Created by Ross Patman on 15/02/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import Combine

public protocol APIV3Requester: JSONContentTypeHeaderRequestInserting, DeviceIdHeaderRequestInserting, OAuthHeaderRequestInserting {
    static func root() -> RequestRootURL
    static func preDispatchAction() -> AnyPublisher<Any?, Error>?
    static func interceptors() -> [(URLRequest) -> (URLRequest)]?
    static func dateFormat() -> RequesterDateFormat?
}

extension APIV3Requester {
    public static func preDispatchAction() -> AnyPublisher<Any?, Error>?  {
        guard let publisher: AnyPublisher<Void, Never> = APIV3RequesterHelper.tokenManager.getTokenObservable else {
            return nil
        }
        return publisher
            .setFailureType(to: Error.self)
            .map { $0 as Any }
            .eraseToAnyPublisher()

    }

    public static func interceptors() -> [(URLRequest) -> (URLRequest)]? {
        return [
            addJSONContentTypeHeader,
            addDeviceIdHeader,
            addOAuthHeader
        ]
    }

    public static func root() -> RequestRootURL {
        return APIV3RequesterHelper.v3baseUrl
    }

    public static func dateFormatString() -> String {
        return "yyyy-MM-dd'T'HH:mm:ssZ"
    }

    public static func dateFormat() -> RequesterDateFormat? {
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
