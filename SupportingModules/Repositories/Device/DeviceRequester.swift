//
//  DeviceRequester.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import APIV3Utilities

public struct DeviceRequester: Requester, APIV3Requester {
    public static var endpoint: String? = "/device"
}

extension DeviceRequester {
    static var current: URLRequest {
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint!,
            httpMethod: .GET,
            body: nil,
            headers: nil)
    }

    static func register(device: Device) -> URLRequest {
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint! + "/register",
            httpMethod: .POST,
            body: device.jsonRepresentation,
            headers: nil)
    }

    static func register(tokenForPushNotificationsWithDeviceToken deviceToken: DeviceToken) -> URLRequest {
        var body: [String: Any] = [:]
        body["provider"] = deviceToken.provider ?? ""
        body["providerToken"] = deviceToken.providerToken ?? ""
        return RequestCreator.createRequest(
            withRoot: root(),
            andEndpoint: endpoint! + "/me/token",
            httpMethod: .POST,
            body: body,
            headers: nil)
    }
}
