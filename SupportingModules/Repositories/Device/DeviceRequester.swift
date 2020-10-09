//
//  DeviceRequester.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation

struct DeviceRequester: Requester, APIV3Requester {
    static var endpoint: String? = "/device"
}
extension DeviceRequester {
    static var current: URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint!, httpMethod: .GET, body: nil, headers: nil)
    }

    static func register(device: Device) -> URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/register", httpMethod: .POST, body: device.jsonRepresentation, headers: nil)
    }

    static func register(tokenForPushNotificationsWithDeviceToken deviceToken: DeviceToken) -> URLRequest {
        var body: [String: Any] = [:]
        body["provider"] = deviceToken.provider ?? ""
        body["providerToken"] = deviceToken.providerToken ?? ""
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/token", httpMethod: .POST, body: body, headers: nil)
    }

    static func post(deviceCapabilityConsents consents: [String: Any]) -> URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/consent", httpMethod: .POST, body: consents)
    }

    static func post(devicePushNotificationConsents consents: [String: Any]) -> URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/push-consent", httpMethod: .POST, body: consents)
    }

    static func getGranularPushConsents() -> URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/push-consent", httpMethod: .GET)
    }

    static var selectedEvent: URLRequest {
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/event", httpMethod: .GET)
    }

    static func updateSelectedEvent(withId id: Int?) -> URLRequest {
        var body: [String: Any]?
        if let id = id { body = ["eventId": id] }
        return RequestCreator.createRequest(withRoot: root(), andEndpoint: endpoint! + "/me/event", httpMethod: .POST, body: body)
    }
}
