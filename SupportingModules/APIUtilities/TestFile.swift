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

let bag: DisposeBag = DisposeBag()

public func testMethod() {
    let device = Device(token: "MWIwMjMyZTI0N2ZjMDM1Y2NjNDFmN2YyM2E4MWQ5ZmZiMTI0NTUzMmM2MDczMDVhYmI0Y2MyZjM3MjJlMTQ1Mg",
                        type: "IOS",
                        appVersion: "sdk_0.0.1alpha",
                        osVersion: "13.3")
    DeviceSender.register(device: device)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { token in
            print("I gots a token!", token)
        }, onError: { error in
            print("I gots a error, not a token!", error)
        }).disposed(by: bag)
}

struct Device: Codable {
    let token: String
    let type: String
    let appVersion: String
    let osVersion: String

    var jsonRepresentation: [String: Any] {
        guard let data = try? JSONEncoder().encode(self), let json = try? JSONSerialization.jsonObject(with: data, options: []), let jsonDict = json as? [String: Any] else { return [:] }
        return jsonDict
    }
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
