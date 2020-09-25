//
//  DeviceRequester.swift
//  CLArena
//
//  Created by Ross Patman on 10/09/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//

import Foundation
import APILayer
import RxSwift

struct Device: Codable {
    var jsonRepresentation: [String: Any] { [:] }
}

struct DeviceToken: Codable {
    let provider: String?
    let providerToken: String?
}

struct DeviceRequester: Requester, APIV3Requester {
    static var endpoint: String? = "/device"
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

//public static func createRequest(
//    withRoot root: String,
//    andEndpoint endpoint: String,
//    httpMethod: HttpMethod,
//    body: [String: Any]? = nil,
//    bodyData: Data? = nil,
//    headers: [String: String]? = nil) -> URLRequest {
//}
//public static func createRequest(
//    withRoot root: RequestRootURL,
//    andEndpoint endpoint: String,
//    httpMethod: HttpMethod,
//    body: [String: Any]? = nil,
//    bodyData: Data? = nil,
//    headers: [String: String]? = nil) -> URLRequest {
//
//    }

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

//
//  DeviceSender.swift
//  CLArena
//
//  Created by apple on 25/11/2018.
//  Copyright © 2018 ConcertLive. All rights reserved.
//
struct DeviceSender: RemoteDiskCacheDataProviding {
    typealias Cdble = StandardV3SenderResponse
    typealias Rqstr = DeviceRequester

    enum DeviceUpdateKeys: String {
        case deviceConsent // ⤵
        case pushNotification, locationCapture, camera, photoSharing, calendar, locationGranular
    }
}

extension DeviceSender {
    static func register(device: Device) -> Observable<Bool> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.register(device: device), strategy: .remoteWithoutCachingResponse).map { $0.isSuccess }
    }

    struct TokenRegistrationResponse: Codable {
        let snsEndpoint: String?
    }

    static func register(tokenForPushNotificationsWithDeviceToken deviceToken: DeviceToken) -> Observable<TokenRegistrationResponse> {
        return retrieve(type: TokenRegistrationResponse.self, forRequest: Rqstr.register(tokenForPushNotificationsWithDeviceToken: deviceToken), strategy: .remoteWithoutCachingResponse)
    }

    static func update(deviceCapabilityConsents consents: [String: Any]) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.post(deviceCapabilityConsents: consents), strategy: .remoteWithoutCachingResponse)
    }

    static func update(devicePushNotificationConsents consents: [String: Any]) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.post(devicePushNotificationConsents: consents), strategy: .remoteWithoutCachingResponse)
    }

    static func updateSelectedEvent(withId id: Int?) -> Observable<StandardV3SenderResponse> {
        return retrieve(type: StandardV3SenderResponse.self, forRequest: Rqstr.updateSelectedEvent(withId: id), strategy: .remote)
    }
}
